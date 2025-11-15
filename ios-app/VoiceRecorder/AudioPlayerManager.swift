//
//  AudioPlayerManager.swift
//  VoiceRecorder
//
//  Gestor de reproducción de audio
//

import Foundation
import AVFoundation
import SwiftUI

class AudioPlayerManager: NSObject, ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    @Published var currentRecordingID: UUID?

    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?

    func playRecording(_ recording: Recording) {
        // Si ya estamos reproduciendo esta grabación, pausar
        if currentRecordingID == recording.id && isPlaying {
            pausePlayback()
            return
        }

        // Si es una grabación diferente, detener la actual
        if currentRecordingID != recording.id {
            stopPlayback()
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recording.fileURL)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()

            duration = recording.duration
            currentRecordingID = recording.id

            audioPlayer?.play()
            isPlaying = true

            startTimer()

        } catch {
            print("Error al reproducir audio: \(error)")
        }
    }

    func pausePlayback() {
        audioPlayer?.pause()
        isPlaying = false
        timer?.invalidate()
    }

    func stopPlayback() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
        currentTime = 0
        currentRecordingID = nil
        timer?.invalidate()
    }

    func seek(to time: TimeInterval) {
        audioPlayer?.currentTime = time
        currentTime = time
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.currentTime = player.currentTime
        }
    }
}

extension AudioPlayerManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            self.stopPlayback()
        }
    }
}
