//
//  RemindersApp.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

@main
struct RemindersApp: SwiftUI.App {
    var view: some View {
        ContentView()
    }

    var body: some Scene {
        if let realmPath = ProcessInfo.processInfo.environment["REALM_PATH"] {
            Realm.Configuration.defaultConfiguration =
                Realm.Configuration(fileURL: URL(string: realmPath)!, deleteRealmIfMigrationNeeded: true)
        } else {
            Realm.Configuration.defaultConfiguration =
                Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        }
        return WindowGroup {
            view
        }
    }
}
