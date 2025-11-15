//
//  AudioRecorderManager.swift
//  GrabadoraAudio
//
//  Maneja la grabación de audio usando AVFoundation
//

import Foundation
import AVFoundation
import Combine

class AudioRecorderManager: NSObject, ObservableObject {
    // MARK: - Published Properties
    @Published var isRecording = false
    @Published var isPaused = false
    @Published var recordingTime: TimeInterval = 0
    @Published var hasPermission = false

    // MARK: - Private Properties
    private var audioRecorder: AVAudioRecorder?
    private var timer: Timer?
    private var recordingURL: URL?

    // MARK: - Initialization
    override init() {
        super.init()
        checkPermissions()
    }

    // MARK: - Permission Handling
    func checkPermissions() {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .granted:
            hasPermission = true
        case .denied:
            hasPermission = false
        case .undetermined:
            requestPermission()
        @unknown default:
            hasPermission = false
        }
    }

    private func requestPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
            DispatchQueue.main.async {
                self?.hasPermission = granted
            }
        }
    }

    // MARK: - Recording Controls
    func startRecording() {
        guard hasPermission else {
            requestPermission()
            return
        }

        let audioSession = AVAudioSession.sharedInstance()

        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)

            // Crear URL para el archivo de audio
            let fileName = "recording_\(Date().timeIntervalSince1970).m4a"
            let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            recordingURL = documentPath.appendingPathComponent(fileName)

            // Configuración de la grabación
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            // Iniciar grabación
            audioRecorder = try AVAudioRecorder(url: recordingURL!, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()

            isRecording = true
            recordingTime = 0
            startTimer()

        } catch {
            print("Error al iniciar grabación: \(error.localizedDescription)")
        }
    }

    func pauseRecording() {
        audioRecorder?.pause()
        isPaused = true
        stopTimer()
    }

    func resumeRecording() {
        audioRecorder?.record()
        isPaused = false
        startTimer()
    }

    func stopRecording() -> URL? {
        audioRecorder?.stop()
        isRecording = false
        isPaused = false
        stopTimer()

        let duration = recordingTime
        recordingTime = 0

        // Desactivar la sesión de audio
        try? AVAudioSession.sharedInstance().setActive(false)

        return recordingURL
    }

    // MARK: - Timer
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.recordingTime += 1
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - Helper
    func getRecordingDuration() -> TimeInterval {
        return recordingTime
    }
}

// MARK: - AVAudioRecorderDelegate
extension AudioRecorderManager: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            print("Grabación finalizada sin éxito")
        }
    }

    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if let error = error {
            print("Error de codificación: \(error.localizedDescription)")
        }
    }
}
