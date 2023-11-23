//
//  EmptyView.swift
//  Reminder
//
//  Created by Lorenzo Overa on 17/11/23.
//

import SwiftUI
import SwiftData


struct ReminderListView: View {
    //@Environment(\.presentationMode) var presentationMode
    @Query private var items: [Reminder]
    @State private var isCircleFilled = false
    @State private var isShowingModal2 = false
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.orange))]
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(items) { item in
                    ReminderItemView(item: item)
                    
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Menu {
                            Button(action: {
                                // Handle Option 1 action
                            }) {
                                Label("View as Columns", systemImage: "list.bullet")
                            }
                            
                            Divider()
                            
                            Button(action: {
                                
                            }) {
                                Label("Show list Info", systemImage: "info.circle")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Select Reminders", systemImage: "checkmark.circle")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("New Section", systemImage: "list.bullet")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Sort By", systemImage: "arrow.up.arrow.down")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Show Completed", systemImage: "eye")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Save as Template", systemImage: "plus.square.on.square")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Print", systemImage: "printer")
                            }
                            
                            Button(action: {
                                
                            }) {
                                Label("Delete List", systemImage: "trash")
                                    
                            }
                            
                            


                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                        
                        
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        
                            .font(.headline)
                            .fontWeight(.bold)
                        Button("New Reminder") {
                            isShowingModal2.toggle()
                        }
                        
                        .font(.system(.headline, design: .rounded))
                        
                        .padding(-10)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("New Reminder")
                    .foregroundStyle(.orange)
                    //.font(.system(.headline, design: .rounded))
                    .fontWeight(.semibold)
                    .sheet(isPresented: $isShowingModal2) {
                        AddReminderView()
                    }
                    Button(""){
                        
                    }
                }
            }
        }
        
        .navigationTitle("Promemoria")
        .navigationBarTitleDisplayMode(.large)
        /*
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading:
         Button(action: {
         presentationMode.wrappedValue.dismiss()
         }) {
         HStack {
         Image(systemName: "chevron.left")
         Text("Your Previous View Title")
         }
         }
         )
         */
    }
}

#Preview {
    ReminderListView()
}
