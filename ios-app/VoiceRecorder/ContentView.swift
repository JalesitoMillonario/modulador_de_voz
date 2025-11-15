//
//  ContentView.swift
//  VoiceRecorder
//
//  Vista principal de la aplicación
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recorder = AudioRecorderManager()
    @StateObject private var player = AudioPlayerManager()
    @State private var showingDeleteAlert = false
    @State private var recordingToDelete: IndexSet?

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Sección de grabación
                VStack(spacing: 20) {
                    if !recorder.hasPermission {
                        VStack(spacing: 12) {
                            Image(systemName: "mic.slash.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.red)
                            Text("Se necesita permiso del micrófono")
                                .font(.headline)
                            Text("Ve a Configuración > VoiceRecorder > Micrófono")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                    } else {
                        // Botón de grabación
                        Button(action: {
                            if recorder.isRecording {
                                recorder.stopRecording()
                            } else {
                                player.stopPlayback()
                                recorder.startRecording()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(recorder.isRecording ? Color.red : Color.red.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.red, lineWidth: 4)
                                    )

                                if recorder.isRecording {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                        .frame(width: 30, height: 30)
                                } else {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 60, height: 60)
                                }
                            }
                        }

                        // Temporizador
                        if recorder.isRecording {
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                Text(recorder.formattedRecordingTime)
                                    .font(.system(size: 28, weight: .light, design: .monospaced))
                            }
                            .padding(.top, 8)
                        } else {
                            Text("Toca para grabar")
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.top, 8)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(Color(uiColor: .systemBackground))

                Divider()

                // Lista de grabaciones
                if recorder.recordings.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "waveform")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary.opacity(0.5))
                        Text("No hay grabaciones")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Presiona el botón rojo para empezar a grabar")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    List {
                        ForEach(recorder.recordings) { recording in
                            RecordingRowView(
                                recording: recording,
                                player: player,
                                isPlaying: player.isPlaying && player.currentRecordingID == recording.id
                            )
                        }
                        .onDelete { indexSet in
                            recordingToDelete = indexSet
                            showingDeleteAlert = true
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("🎙️ Grabadora")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Eliminar grabación", isPresented: $showingDeleteAlert) {
            Button("Cancelar", role: .cancel) {
                recordingToDelete = nil
            }
            Button("Eliminar", role: .destructive) {
                if let indexSet = recordingToDelete {
                    recorder.deleteRecording(at: indexSet)
                }
                recordingToDelete = nil
            }
        } message: {
            Text("¿Estás seguro de que quieres eliminar esta grabación?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
