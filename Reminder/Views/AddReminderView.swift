import SwiftUI
import SwiftData

struct AddReminderView: View {
   // @State private var titleText: String = ""
   // @State private var notesText: String = ""
    @State private var showConfirmation = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @FocusState var focused: Bool?
    @State private var item = Reminder()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray)
                    .ignoresSafeArea()
                    .opacity(0.1)
                
                List {
                    Section {
                        TextField("Title", text: $item.title)
                            .focused($focused, equals: true)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    self.focused = true
                                }
                            }
                        
                        TextField("Notes", text: $item.notes, axis: .vertical)
                            .lineLimit(4...10)
                    }
                    
                    Section {
                        NavigationLink(destination: EmptyView()) {
                            HStack {
                                Text("Details")
                                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: ReminderListView()) {
                            HStack {
                                Image(systemName: "list.bullet.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(.orange)
                                    .symbolRenderingMode(.multicolor)
                                Text("List")
                                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                                Spacer()
                                Text("Promemoria")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding(.top, -25)
                .listSectionSpacing(15)
            }
            .navigationTitle("New Remainder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showConfirmation = true
                    }, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add"){
                        withAnimation{
                            context.insert(item)
                        }
                        dismiss()
                    }
                }
            }
            .interactiveDismissDisabled()
            .confirmationDialog("Discard Changes?", isPresented: $showConfirmation) {
                Button("Discard", role: .destructive) {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Cancel", role: .cancel) {
                    // Handle cancel action
                }
            }
            .gesture(
                DragGesture().onEnded({ value in
                    if value.translation.height >= 10 {
                        showConfirmation.toggle()
                    }
                }))
            
            
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
            .modelContainer(for: Reminder.self)
    }
}
