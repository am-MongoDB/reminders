//
//  ReminderListRowView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct ReminderListRowView: View {
    @ObservedRealmObject var list: ReminderList

    var body: some View {
        HStack {
            Image(systemName: list.icon)
            TextField("List Name", text: $list.name)
            Spacer()
            Text("\(list.reminders.count)")
        }.frame(minWidth: 100)
    }
}

//struct ReminderListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderListRowView()
//    }
//}
