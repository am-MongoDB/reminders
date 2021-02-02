//
//  ReminderList.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import RealmSwift

@objcMembers class ReminderList: Object, ObjectKeyIdentifiable {
    dynamic var name = "New List"
    dynamic var icon: String = "list.bullet"
    var reminders = RealmSwift.List<Reminder>()
}
