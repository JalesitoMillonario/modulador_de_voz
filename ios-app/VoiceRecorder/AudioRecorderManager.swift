//
//  AudioRecorderManager.swift
//  VoiceRecorder
//
//  Gestor de grabación de audio
//

import Foundation
import AVFoundation
import SwiftUI

class AudioRecorderManager: NSObject, ObservableObject {
    @Published var isRecording = false
    @Published var recordings: [Recording] = []
    @Published var recordingTime: TimeInterval = 0
    @Published var hasPermission = false

    private var audioRecorder: AVAudioRecorder?
    private var timer: Timer?
    private var recordingSession: AVAudioSession!

    override init() {
        super.init()
        setupAudioSession()
        loadRecordings()
    }

    private func setupAudioSession() {
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)

            recordingSession.requestRecordPermission { [weak self] allowed in
                DispatchQueue.main.async {
                    self?.hasPermission = allowed
                }
            }
        } catch {
            print("Error al configurar la sesión de audio: \(error)")
        }
    }

    func startRecording() {
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(UUID().uuidString).m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()

            isRecording = true
            recordingTime = 0

            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.recordingTime = self.audioRecorder?.currentTime ?? 0
            }

        } catch {
            print("Error al iniciar grabación: \(error)")
        }
    }

    func stopRecording() {
        guard let recorder = audioRecorder else { return }

        let duration = recorder.currentTime
        let url = recorder.url

        recorder.stop()
        timer?.invalidate()
        timer = nil
        isRecording = false

        let newRecording = Recording(fileURL: url, duration: duration)
        recordings.insert(newRecording, at: 0)
        saveRecordings()

        audioRecorder = nil
    }

    func deleteRecording(at offsets: IndexSet) {
        offsets.forEach { index in
            let recording = recordings[index]
            try? FileManager.default.removeItem(at: recording.fileURL)
        }
        recordings.remove(atOffsets: offsets)
        saveRecordings()
    }

    private func saveRecordings() {
        if let encoded = try? JSONEncoder().encode(recordings) {
            UserDefaults.standard.set(encoded, forKey: "recordings")
        }
    }

    private func loadRecordings() {
        if let data = UserDefaults.standard.data(forKey: "recordings"),
           let decoded = try? JSONDecoder().decode([Recording].self, from: data) {
            // Filtrar grabaciones cuyo archivo aún existe
            recordings = decoded.filter { recording in
                FileManager.default.fileExists(atPath: recording.fileURL.path)
            }
        }
    }

    var formattedRecordingTime: String {
        let minutes = Int(recordingTime) / 60
        let seconds = Int(recordingTime) % 60
        let fraction = Int((recordingTime.truncatingRemainder(dividingBy: 1)) * 10)
        return String(format: "%02d:%02d.%01d", minutes, seconds, fraction)
    }
}

extension AudioRecorderManager: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            print("La grabación falló")
        }
    }
}
