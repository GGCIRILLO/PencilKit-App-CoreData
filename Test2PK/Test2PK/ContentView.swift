//
//  ContentView.swift
//  Test2PK
//
//  Created by Luigi Cirillo on 11/12/23.
//

import SwiftUI
import CoreData

// ContentView is the main view that displays a list of drawings.
// Users can create new canvases, select existing ones, and edit/delete them.
struct ContentView: View {
    // Managed object context for CoreData operations.
    @Environment(\.managedObjectContext) private var viewContext
    
    // Fetching all Drawing entities for display in the list.
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) private var drawings: FetchedResults<Drawing>
    
    // State to control the sheet for adding a new canvas.
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                // List of drawings with navigation links to DrawingView(open the drawing)
                List {
                    ForEach(drawings) { drawing in
                        NavigationLink(destination: DrawingView(id: drawing.id, data: drawing.canvasData, title: drawing.title)) {
                            Text(drawing.title ?? "Untitled")
                        }
                    }
                    .onDelete(perform: deleteItem)
                    
                    // Button to show the sheet for adding a new canvas
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Canvas")
                        }
                        .foregroundStyle(.blue)
                    })
                    .sheet(isPresented: $showSheet, content: {
                        AddNewCanvasView()
                            .environment(\.managedObjectContext, viewContext)
                    })
                }
                .navigationTitle("Drawings")
                .toolbar {
                    EditButton()
                }
            }
            
            // Placeholder for when no canvas is selected.
            VStack {
                Image(systemName: "scribble.variable")
                    .font(.largeTitle)
                Text("No canvas selected")
                    .font(.title)
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    // Delete selected drawing from the list and CoreData.
    func deleteItem(at offset: IndexSet) {
        for index in offset {
            let deletingItem = drawings[index]
            viewContext.delete(deletingItem)
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
