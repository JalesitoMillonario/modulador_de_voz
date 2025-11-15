//
//  RecordingView.swift
//  GrabadoraAudio
//
//  Vista para grabar audio
//

import SwiftUI

struct RecordingView: View {
    @ObservedObject var recorderManager: AudioRecorderManager
    @ObservedObject var recordingsManager: RecordingsManager

    var body: some View {
        VStack(spacing: 24) {
            if !recorderManager.isRecording {
                // Botón de grabación
                Button(action: {
                    recorderManager.startRecording()
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 120)
                            .shadow(color: .purple.opacity(0.4), radius: 20, x: 0, y: 10)

                        // Anillo pulsante
                        Circle()
                            .stroke(Color.purple.opacity(0.3), lineWidth: 2)
                            .frame(width: 140, height: 140)
                            .scaleEffect(recorderManager.isRecording ? 1.2 : 1.0)
                            .opacity(recorderManager.isRecording ? 0 : 1)

                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                    }
                }
                .buttonStyle(ScaleButtonStyle())

                Text("Presiona para grabar")
                    .font(.headline)
                    .foregroundColor(.secondary)

            } else {
                // Vista de grabación activa
                VStack(spacing: 20) {
                    // Indicador de grabación
                    HStack(spacing: 10) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                            .opacity(recorderManager.isPaused ? 0.5 : 1.0)
                            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: recorderManager.isPaused)

                        Text(recorderManager.isPaused ? "Pausado" : "Grabando")
                            .font(.headline)
                            .foregroundColor(recorderManager.isPaused ? .orange : .red)
                    }

                    // Tiempo de grabación
                    Text(formatTime(recorderManager.recordingTime))
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .monospacedDigit()
                        .foregroundColor(.primary)

                    // Controles
                    HStack(spacing: 20) {
                        // Botón pausar/reanudar
                        Button(action: {
                            if recorderManager.isPaused {
                                recorderManager.resumeRecording()
                            } else {
                                recorderManager.pauseRecording()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 70, height: 70)

                                Image(systemName: recorderManager.isPaused ? "play.fill" : "pause.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(ScaleButtonStyle())

                        // Botón detener
                        Button(action: {
                            if let url = recorderManager.stopRecording() {
                                let duration = recorderManager.getRecordingDuration()
                                recordingsManager.addRecording(fileURL: url, duration: duration)
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.red, Color.pink]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 70, height: 70)

                                Image(systemName: "stop.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                    .padding(.top, 10)
                }
            }
        }
        .padding()
        .alert("Permiso de Micrófono Requerido", isPresented: .constant(!recorderManager.hasPermission && recorderManager.isRecording)) {
            Button("OK") {
                // Abrir configuración
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsUrl)
                }
            }
        } message: {
            Text("Por favor permite el acceso al micrófono en Configuración para usar esta app.")
        }
    }

    private func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// Estilo de botón con efecto de escala
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
