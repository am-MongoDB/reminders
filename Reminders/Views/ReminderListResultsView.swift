//
//  ReminderListResultsView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct ReminderListResultsView: View {
    @StateRealmObject(ReminderList.self) var lists
    @Binding var searchFilter: String

    var filter: NSPredicate {
        searchFilter.isEmpty ? NSPredicate(format: "TRUEPREDICATE") :
            NSPredicate(format: "name CONTAINS[c] %@", searchFilter)
    }

    var body: some View {
        List {
            ForEach(lists.filter(filter)) { list in
                NavigationLink(destination: ReminderListView(list: list)) {
                    ReminderListRowView(list: list)
                }
            }.onDelete(perform: $lists.remove)
        }
    }
}

//struct ReminderListResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderListResultsView()
//    }
//}
