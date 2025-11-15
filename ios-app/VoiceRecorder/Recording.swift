//
//  Recording.swift
//  VoiceRecorder
//
//  Modelo de datos para las grabaciones
//

import Foundation

struct Recording: Identifiable, Codable {
    let id: UUID
    let date: Date
    let fileURL: URL
    var duration: TimeInterval

    init(id: UUID = UUID(), date: Date = Date(), fileURL: URL, duration: TimeInterval = 0) {
        self.id = id
        self.date = date
        self.fileURL = fileURL
        self.duration = duration
    }

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
}
