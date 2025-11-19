//
//  ContentView.swift
//  HeavyWeightMigCoreData
//
//  Created by Orangebits iOS User on 17/11/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<User>
    @State private var showSheet = false
    @State private var txtName = String()
    @State private var txtAge = String()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack(spacing: 100,) {
                        Text(item.name ?? "")
                        
                        Text("\(item.age)")
                    }
                  
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
                        Text("Add")
                    }.sheet(isPresented: $showSheet) {
                        VStack {
                            TextField("Name", text: $txtName)
                            
                            TextField("Age", text: $txtAge)
                            
                            Button("Submit") {
                                addItem()
                                showSheet = false
                            }
                        }.padding()
                            .presentationDetents([.height(180)])
                            .presentationDragIndicator(.hidden)
                    }
                }
            }
            
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = User(context: viewContext)
            newItem.name = txtName
            newItem.age = Int16(txtAge.toInt())
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
              
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
