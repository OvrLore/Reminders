//
//  ReminderApp.swift
//  Reminder
//
//  Created by Lorenzo Overa on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Reminder.self)
    }
}
