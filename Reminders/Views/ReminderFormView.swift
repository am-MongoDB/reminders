//
//  ReminderFormView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct ReminderFormView: View {
    @ObservedRealmObject var list: ReminderList
    @ObservedRealmObject var reminder: Reminder
    @Binding var showReminderForm: Bool

    var body: some View {
        Form {
            TextField("title", text: $reminder.title)
            DatePicker("date", selection: $reminder.date)
            Picker("priority", selection: $reminder.priority, content: {
                ForEach(Reminder.Priority.allCases) { priority in
                    Text(priority.description).tag(priority)
                }
            })
        }
        .navigationTitle(reminder.title)
        .navigationBarItems(trailing:
        Button("Save") {
            if reminder.realm == nil {
                $list.reminders.append(reminder)
            }
            showReminderForm.toggle()
        }.disabled(reminder.title.isEmpty))
    }
}

//struct ReminderFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderFormView()
//    }
//}
