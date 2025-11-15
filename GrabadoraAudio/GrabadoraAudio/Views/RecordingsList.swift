//
//  RecordingsList.swift
//  GrabadoraAudio
//
//  Lista de grabaciones con reproductor
//

import SwiftUI

struct RecordingsList: View {
    let recordings: [Recording]
    @ObservedObject var playerManager: AudioPlayerManager
    @ObservedObject var recordingsManager: RecordingsManager

    @State private var playingRecordingId: UUID?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(recordings) { recording in
                    RecordingRow(
                        recording: recording,
                        isPlaying: playingRecordingId == recording.id && playerManager.isPlaying,
                        currentTime: playingRecordingId == recording.id ? playerManager.currentTime : 0,
                        duration: playingRecordingId == recording.id ? playerManager.duration : recording.duration,
                        onPlayPause: {
                            handlePlayPause(recording)
                        },
                        onSeek: { time in
                            if playingRecordingId == recording.id {
                                playerManager.seek(to: time)
                            }
                        },
                        onDelete: {
                            recordingsManager.deleteRecording(recording)
                            if playingRecordingId == recording.id {
                                playerManager.stop()
                                playingRecordingId = nil
                            }
                        }
                    )
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }

    private func handlePlayPause(_ recording: Recording) {
        if playingRecordingId == recording.id {
            // Si ya está reproduciendo esta grabación
            if playerManager.isPlaying {
                playerManager.pause()
            } else {
                playerManager.resume()
            }
        } else {
            // Nueva grabación
            playerManager.stop()
            playingRecordingId = recording.id
            playerManager.playRecording(url: recording.fileURL)
        }
    }
}

struct RecordingRow: View {
    let recording: Recording
    let isPlaying: Bool
    let currentTime: TimeInterval
    let duration: TimeInterval
    let onPlayPause: () -> Void
    let onSeek: (TimeInterval) -> Void
    let onDelete: () -> Void

    @State private var showDeleteConfirmation = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text(recording.formattedDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Button(action: {
                    showDeleteConfirmation = true
                }) {
                    Image(systemName: "trash")
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(8)
                        .background(Color.red.opacity(0.1))
                        .clipShape(Circle())
                }
                .buttonStyle(ScaleButtonStyle())
            }

            // Player
            HStack(spacing: 12) {
                // Play/Pause button
                Button(action: onPlayPause) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)

                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(ScaleButtonStyle())

                // Progress bar and time
                VStack(spacing: 6) {
                    // Progress bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            // Background
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 6)

                            // Progress
                            RoundedRectangle(cornerRadius: 3)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.purple, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: progressWidth(for: geometry.size.width), height: 6)
                        }
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let newTime = (value.location.x / geometry.size.width) * duration
                                    onSeek(max(0, min(newTime, duration)))
                                }
                        )
                    }
                    .frame(height: 20)

                    // Time display
                    HStack {
                        Text(formatTime(currentTime))
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .monospacedDigit()

                        Spacer()

                        Text(formatTime(duration))
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .monospacedDigit()
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .alert("Eliminar Grabación", isPresented: $showDeleteConfirmation) {
            Button("Cancelar", role: .cancel) { }
            Button("Eliminar", role: .destructive) {
                onDelete()
            }
        } message: {
            Text("¿Estás seguro de que quieres eliminar esta grabación? Esta acción no se puede deshacer.")
        }
    }

    private func progressWidth(for totalWidth: CGFloat) -> CGFloat {
        guard duration > 0 else { return 0 }
        return totalWidth * CGFloat(currentTime / duration)
    }

    private func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
