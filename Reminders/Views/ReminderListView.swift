//
//  ReminderListView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct ReminderListView: View {
    @ObservedRealmObject var list: ReminderList
    @State var newReminderAdded = false

    func shouldFocusReminder(_ reminder: Reminder) -> Bool {
        return newReminderAdded &&
            list.reminders.lastIndex(of: reminder) == (list.reminders.count - 1)
    }

    var body: some View {
        VStack {
            List {
                ForEach(list.reminders) { reminder in
                    ReminderRowView(list: list,
                                    reminder: reminder,
                                    hasFocus: shouldFocusReminder(reminder))
                }.onMove(perform: $list.reminders.move)
                .onDelete(perform: $list.reminders.remove)
            }
        }.navigationTitle(list.name)
        .navigationBarItems(trailing: HStack {
            EditButton()
            Button("add") {
                newReminderAdded = true
                $list.reminders.append(Reminder())
            }
        })
    }
}

//struct ReminderListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderListView()
//    }
//}
