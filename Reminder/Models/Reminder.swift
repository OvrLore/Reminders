//
//  Reminder.swift
//  Reminder
//
//  Created by Lorenzo Overa on 17/11/23.
//

import Foundation
import SwiftData

@Model
class Reminder {
    var title : String
    var notes : String
    var isCompleted : Bool
    
    init(title: String = "",
         notes: String = "",
         isCompleted: Bool = false
    ) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
    }
}


