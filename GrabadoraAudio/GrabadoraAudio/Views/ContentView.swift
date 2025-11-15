//
//  ContentView.swift
//  GrabadoraAudio
//
//  Vista principal de la aplicación
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recorderManager = AudioRecorderManager()
    @StateObject private var recordingsManager = RecordingsManager()
    @StateObject private var playerManager = AudioPlayerManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "mic.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.purple)

                        Text("Grabadora")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }

                    Text("Graba, guarda y reproduce tus audios")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))

                // Recording View
                RecordingView(
                    recorderManager: recorderManager,
                    recordingsManager: recordingsManager
                )
                .padding(.vertical, 20)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

                // Recordings List
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Mis Grabaciones")
                            .font(.title2)
                            .fontWeight(.bold)

                        if !recordingsManager.recordings.isEmpty {
                            Text("(\(recordingsManager.recordings.count))")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    if recordingsManager.recordings.isEmpty {
                        EmptyRecordingsView()
                    } else {
                        RecordingsList(
                            recordings: recordingsManager.recordings,
                            playerManager: playerManager,
                            recordingsManager: recordingsManager
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))
            }
            .navigationBarHidden(true)
        }
    }
}

struct EmptyRecordingsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "tray")
                .font(.system(size: 60))
                .foregroundColor(.secondary)

            Text("No hay grabaciones aún")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("Presiona el botón de arriba para grabar")
                .font(.subheadline)
                .foregroundColor(.secondary.opacity(0.7))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}
