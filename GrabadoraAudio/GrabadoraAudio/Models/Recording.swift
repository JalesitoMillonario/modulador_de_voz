//
//  Recording.swift
//  GrabadoraAudio
//
//  Modelo de datos para una grabación de audio
//

import Foundation

struct Recording: Identifiable, Codable {
    let id: UUID
    let date: Date
    let duration: TimeInterval
    let fileURL: URL

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.string(from: date)
    }

    var formattedDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    init(id: UUID = UUID(), date: Date = Date(), duration: TimeInterval = 0, fileURL: URL) {
        self.id = id
        self.date = date
        self.duration = duration
        self.fileURL = fileURL
    }
}
