//
//  Reminder.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import Foundation
import RealmSwift

@objcMembers class Reminder: EmbeddedObject, ObjectKeyIdentifiable {
    @objc enum Priority: Int, RealmEnum, CaseIterable, Identifiable, CustomStringConvertible {
        var id: Int { self.rawValue }

        case low, medium, high

        var description: String {
            switch self {
            case .low: return "low"
            case .medium: return "medium"
            case .high: return "high"
            }
        }
    }
    dynamic var title = ""
    dynamic var notes = ""
    dynamic var isFlagged = false
    dynamic var date = Date()
    dynamic var isComplete = false
    dynamic var priority: Priority = .low
}
