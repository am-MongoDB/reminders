//
//  Footer.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI
import RealmSwift

struct Footer: View {
    @StateRealmObject(ReminderList.self) var lists

    var body: some View {
        HStack {
            Button(action: {
                $lists.append(ReminderList())
            }, label: {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add list")
                }
            }).buttonStyle(BorderlessButtonStyle())
            .padding()
            Spacer()
        }
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
