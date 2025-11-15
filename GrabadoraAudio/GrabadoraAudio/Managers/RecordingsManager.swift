//
//  RecordingsManager.swift
//  GrabadoraAudio
//
//  Maneja el almacenamiento y recuperación de grabaciones
//

import Foundation

class RecordingsManager: ObservableObject {
    @Published var recordings: [Recording] = []

    private let userDefaultsKey = "savedRecordings"

    init() {
        loadRecordings()
    }

    // MARK: - CRUD Operations
    func addRecording(fileURL: URL, duration: TimeInterval) {
        let recording = Recording(
            date: Date(),
            duration: duration,
            fileURL: fileURL
        )

        recordings.insert(recording, at: 0) // Agregar al inicio
        saveRecordings()
    }

    func deleteRecording(_ recording: Recording) {
        // Eliminar el archivo de audio
        try? FileManager.default.removeItem(at: recording.fileURL)

        // Eliminar de la lista
        recordings.removeAll { $0.id == recording.id }
        saveRecordings()
    }

    func deleteRecording(at offsets: IndexSet) {
        for index in offsets {
            let recording = recordings[index]
            try? FileManager.default.removeItem(at: recording.fileURL)
        }

        recordings.remove(atOffsets: offsets)
        saveRecordings()
    }

    // MARK: - Persistence
    private func saveRecordings() {
        // Guardar las grabaciones (sin el fileURL completo, solo el nombre del archivo)
        let recordingsData = recordings.map { recording -> [String: Any] in
            return [
                "id": recording.id.uuidString,
                "date": recording.date.timeIntervalSince1970,
                "duration": recording.duration,
                "fileName": recording.fileURL.lastPathComponent
            ]
        }

        UserDefaults.standard.set(recordingsData, forKey: userDefaultsKey)
    }

    private func loadRecordings() {
        guard let recordingsData = UserDefaults.standard.array(forKey: userDefaultsKey) as? [[String: Any]] else {
            return
        }

        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        recordings = recordingsData.compactMap { data in
            guard let idString = data["id"] as? String,
                  let id = UUID(uuidString: idString),
                  let dateInterval = data["date"] as? TimeInterval,
                  let duration = data["duration"] as? TimeInterval,
                  let fileName = data["fileName"] as? String else {
                return nil
            }

            let fileURL = documentPath.appendingPathComponent(fileName)

            // Verificar que el archivo existe
            guard FileManager.default.fileExists(atPath: fileURL.path) else {
                return nil
            }

            return Recording(
                id: id,
                date: Date(timeIntervalSince1970: dateInterval),
                duration: duration,
                fileURL: fileURL
            )
        }
    }
}
