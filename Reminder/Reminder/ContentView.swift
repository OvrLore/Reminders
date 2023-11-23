//
//  ContentView.swift
//  Reminder
//
//  Created by Lorenzo Overa on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchtext: String = ""
    @State private var isShowingModal = false
    @State private var showList = false
    @Query private var items: [Reminder]
    @FocusState var focused: Bool?
    @Environment(\.colorScheme) var colorScheme
    
    var viewmodel = CustomButtonsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                
                if (colorScheme == .dark){
                    Color.black
                    .ignoresSafeArea()
                }
                else {
                    Color.gray
                        .opacity(0.1)
                        .ignoresSafeArea()
                }
                
                VStack {
                    ScrollView {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $searchtext)
                            Image(systemName: "mic.fill")
                        }
                        
                        .fontWeight(.medium)
                        .foregroundStyle(Color(.gray))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.lightGray).opacity(0.3))
                                .opacity(0.7)
                        )
                        
                        //.background(Color(.lightGray).opacity(0.5))
                        .foregroundStyle(.black)
                        .opacity(0.9)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                        
                        
                        HStack(spacing: 15) {
                            VStack(spacing: 15) {
                                ForEach(viewmodel.customButtons) { button in
                                    Button(action: {
                                        
                                    }) {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(colorScheme == .dark ? (Color(.darkGray).opacity(0.4)) : Color.white)
                                            .frame(width: 170, height: 85)
                                            .overlay(
                                                VStack() {
                                                    HStack() {
                                                        button.icon
                                                            .symbolRenderingMode(.palette)
                                                            .foregroundStyle(Color.white,button.iconColor)
                                                            
                                                            .padding(.leading, 10)
                                                            .font(.largeTitle)
                                                        Spacer()
                                                        Text("0")
                                                            .fontWeight(.bold)
                                                            .font(.title)
                                                            .padding(.trailing, 20)
                                                            .foregroundStyle(colorScheme == .dark ? (Color(.white)) : Color.black)
                                                    }
                                                    .padding(.bottom, 5)
                                                    
                                                    Text(button.name)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .padding(.leading, 10)
                                                        .foregroundStyle(.gray)
                                                        .fontWeight(.semibold)
                                                        .font(.headline)
                                                })
                                    }
                                }
                            }
                            VStack(spacing: 15) {
                                ForEach(viewmodel.customButtons2) { button in
                                    Button(action: {
                                        
                                    }) {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(colorScheme == .dark ? (Color(.darkGray).opacity(0.4)) : Color.white)
                                            .frame(width: 170, height: 85)
                                            .overlay(
                                                VStack() {
                                                    HStack() {
                                                        button.icon
                                                            .symbolRenderingMode(.multicolor)
                                                            .foregroundStyle(button.iconColor)
                                                            .padding(.leading, 10)
                                                            .font(.largeTitle)
                                                        Spacer()
                                                        Text("0")
                                                            .fontWeight(.bold)
                                                            .padding(.trailing, 10)
                                                            .foregroundStyle(colorScheme == .dark ? (Color(.white)) : Color.black)
                                                            .font(.system(.title, design: .rounded))
                                                    }
                                                    .padding(.bottom, 5)
                                                    
                                                    
                                                    Text(button.name)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .padding(.leading, 10)
                                                        .foregroundStyle(.gray)
                                                        .fontWeight(.semibold)
                                                        .font(.headline)
                                                }
                                            )
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.bottom, 5)
                        
                        VStack {
                            
                            Text("My Lists")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .padding(.trailing, 260)
                            
                            
                            
                            NavigationLink(destination: ReminderListView()) {
                                HStack {
                                    Image(systemName: "list.bullet.circle.fill")
                                        .font(.largeTitle)
                                        .symbolRenderingMode(.multicolor)
                                        .foregroundStyle(.orange)
                                        .padding(.leading, 10)
                                    
                                    Text("Promemoria")
                                        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                                    
                                    Spacer()
                                    
                                    Text("\(items.count)")
                                        .foregroundStyle(colorScheme == .dark ? (Color(.lightGray))  : (Color(.darkGray)))
                                        .opacity(0.8)
                                        .padding(.horizontal, -40)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .opacity(0.8)
                                        .padding(.horizontal, -30)
                                }
                                
                                .frame(minWidth: 333, minHeight: 55)
                                .frame(maxWidth: 355)
                                .background(colorScheme == .dark ? (Color(.darkGray).opacity(0.4)) : Color.white)
                                .cornerRadius(12)
                                .padding(.top, -5)
                                
                            }
                        }
                    }
                    
                }
            }
            
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            
                        }) {
                            Label("Edit Lists", systemImage: "pencil")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Label("Templates", systemImage: "square.on.square")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.blue)
                            .font(.headline)
                            .fontWeight(.bold)
                        Button("New Reminder") {
                            isShowingModal.toggle()
                        }
                        
                        .font(.system(.headline, design: .rounded))
                        
                        .padding(-10)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("New Reminder")
                    
                    
                    
                    //.font(.system(.headline, design: .rounded))
                    .fontWeight(.semibold)
                    .sheet (isPresented: $isShowingModal) {
                        AddReminderView()
                    }
                    
                    //ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            showList.toggle()
                        }) {
                            Text("Add List")
                        }
                        .sheet(isPresented: $showList) {
                            HalfList(focused: _focused)
                                .presentationDetents([.height(180)])
                        }
                  //  }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
