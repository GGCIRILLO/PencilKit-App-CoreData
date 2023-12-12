//
//  AddNewCanvasView.swift
//  Test2PK
//
//  Created by Luigi Cirillo on 11/12/23.
//

import SwiftUI

// AddNewCanvasView is the view for creating a new canvas.
// Users can input a title, and it is saved using CoreData.
struct AddNewCanvasView: View {
    // Managed object context for CoreData operations.
    @Environment(\.managedObjectContext) private var viewContext
    
    // Presentation mode to dismiss the view.
    @Environment(\.presentationMode) private var presentationMode
    
    // State for storing the canvas title.
    @State private var canvasTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Text field for entering the canvas title.
                    TextField("Canvas Title", text: $canvasTitle)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle(Text("Add new canvas"))
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }),
                trailing: Button(action: {
                    // Check if the canvas title is not empty.
                    if !canvasTitle.isEmpty {
                        // Create a new Drawing entity in the CoreData managed object context.
                        let drawing = Drawing(context: viewContext)
                        
                        // Set the title of the drawing to the entered canvas title.
                        drawing.title = canvasTitle
                        
                        // Generate a unique identifier (UUID) for the drawing.
                        drawing.id = UUID()
                        
                        do {
                            // Save the new drawing to the CoreData managed object context.
                            try viewContext.save()
                        } catch {
                            // Print an error message if there's an issue with saving.
                            print(error)
                        }
                        
                        // Dismiss the current view and return to the previous view.
                        self.presentationMode.wrappedValue.dismiss()

                    }
                }, label: {
                    Text("Save")
                })
            )
        }
    }
}
#Preview {
    AddNewCanvasView()
}
