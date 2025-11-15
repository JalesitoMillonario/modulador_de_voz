//
//  RecordingRowView.swift
//  VoiceRecorder
//
//  Vista de cada fila de grabación
//

import SwiftUI

struct RecordingRowView: View {
    let recording: Recording
    @ObservedObject var player: AudioPlayerManager
    let isPlaying: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                // Botón de reproducción
                Button(action: {
                    player.playRecording(recording)
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 44))
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(recording.formattedDate)
                        .font(.headline)

                    Text(recording.formattedDuration)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            // Barra de progreso
            if isPlaying {
                VStack(spacing: 4) {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            // Fondo
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 4)
                                .cornerRadius(2)

                            // Progreso
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: geometry.size.width * CGFloat(player.currentTime / recording.duration), height: 4)
                                .cornerRadius(2)
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let progress = value.location.x / geometry.size.width
                                    let newTime = recording.duration * Double(progress)
                                    player.seek(to: max(0, min(newTime, recording.duration)))
                                }
                        )
                    }
                    .frame(height: 4)

                    HStack {
                        Text(formatTime(player.currentTime))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(formatTime(recording.duration))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }

    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
