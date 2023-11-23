//
//  HalfList.swift
//  Reminder
//
//  Created by Lorenzo Overa on 20/11/23.
//

import SwiftUI

struct HalfList: View {
   // @State var testoTitolo: String
   // @State var testoDescr: String
    @FocusState var focused: Bool?
    @State private var item = Reminder()
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            TextField("e.g., Read a book chapter every day at...", text: $item.title)
                .font(.title2)
                .focused($focused, equals: true)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.focused = true
                    }
                }
            TextField("Description", text: $item.notes, axis: .vertical )
                .lineLimit(4...10)
            Spacer()
            HStack(){
                Spacer()
                Button("Add"){
                    withAnimation{
                        context.insert(item)
                    }
                    dismiss()
                }
            }
        }
        .padding()
    }
}

#Preview {
    HalfList()
}
