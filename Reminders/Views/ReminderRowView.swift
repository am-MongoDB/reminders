//
//  ReminderRowView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct ReminderRowView: View {
    @ObservedRealmObject var list: ReminderList
    @ObservedRealmObject var reminder: Reminder
    @State var hasFocus: Bool
    @State var showReminderForm = false


    var body: some View {
        NavigationLink(destination: ReminderFormView(list: list,
                                                     reminder: reminder,
                                                     showReminderForm: $showReminderForm), isActive: $showReminderForm) {
            FocusableTextField("title", text: reminder.bind(\.title), isFirstResponder: $hasFocus).textCase(.lowercase)
        }.isDetailLink(true)
    }
}

//struct ReminderRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderRowView()
//    }
//}
