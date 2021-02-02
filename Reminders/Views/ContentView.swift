//
//  ContentView.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State var searchFilter: String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchView(searchFilter: $searchFilter)
                ReminderListResultsView(searchFilter: $searchFilter)
                Spacer()
                Footer()
            }
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("reminders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
