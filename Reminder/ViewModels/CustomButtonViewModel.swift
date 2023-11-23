//
//  LearnerViewModel.swift
//  Reminder
//
//  Created by Lorenzo Overa on 14/11/23.
//

import Foundation
import SwiftUI

class CustomButtonsViewModel {
    
    var customButtons = [
    CustomButton(icon: Image(systemName: "calendar.circle.fill"), name: "Today", itemCounter: 0, iconColor: .blue),
    CustomButton(icon: Image(systemName: "tray.circle.fill"), name: "All", itemCounter: 0, iconColor: .black),
    CustomButton(icon: Image(systemName: "checkmark.circle.fill"), name: "Completed", itemCounter: 0, iconColor: .gray)
    ]
    
    var customButtons2 = [
        CustomButton(icon: Image(systemName: "calendar.circle.fill"), name: "Scheduled", itemCounter: 0, iconColor: .red),
        CustomButton(icon: Image(systemName: "flag.circle.fill"), name: "Flagged", itemCounter: 0, iconColor: .orange)
    ]
}
