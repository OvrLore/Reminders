//
//  ReminderItemView.swift
//  Reminder
//
//  Created by Lorenzo Overa on 19/11/23.
//

import SwiftUI
import SwiftData
struct ReminderItemView: View {
    
    @State private var isCircleFilled = false
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @Bindable var item: Reminder
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                    isCircleFilled.toggle()
                
            } label: {
                Image(systemName: isCircleFilled ? "circle.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(isCircleFilled ? Color.orange : (colorScheme == .dark ? (Color(.darkGray).opacity(0.6))  : (Color(.lightGray).opacity(0.6))))
            }
            .buttonStyle(PlainButtonStyle())
            
             VStack(alignment: .leading) {
                 Text(item.title)
                 Text(item.notes)
                     .foregroundStyle(Color(.lightGray))
             }
        }
        .accessibilityElement(children: .combine)
        
        
        .swipeActions {
            Button(role: .destructive) {
                withAnimation {
                    context.delete(item)
                }
            } label: {
                Text("Delete")
            }
        }
    }
}




