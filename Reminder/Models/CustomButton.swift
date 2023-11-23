//
//  CustomButtons.swift
//  Reminder
//
//  Created by Lorenzo Overa on 14/11/23.
//

import Foundation
import SwiftUI


struct CustomButton : Identifiable {
    var id: UUID = UUID()
    var icon : Image
    var name : String
    var itemCounter : Int
    var iconColor : Color
}
