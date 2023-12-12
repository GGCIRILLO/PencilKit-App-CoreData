//
//  DrawingCanvasView.swift
//  Test2PK
//
//  Created by Luigi Cirillo on 11/12/23.
//

import SwiftUI
import CoreData
import PencilKit

// DrawingCanvasView is a SwiftUI representation of the UIKit DrawingCanvasViewController.
struct DrawingCanvasView: UIViewControllerRepresentable {
    
    // Managed object context for CoreData operations.
    @Environment(\.managedObjectContext) private var viewContext
    
    // Data and ID for the drawing canvas.
    var data: Data
    var id: UUID
    
    // This method is called when the SwiftUI view needs to update the UIKit view controller.
    func updateUIViewController(_ uiViewController: DrawingCanvasViewController, context: Context) {
        // Update the UIKit view controller's drawing data with the latest data.
        uiViewController.drawingData = data
    }
    
    // Type alias to specify the type of the represented UIViewController.
    typealias UIViewControllerType = DrawingCanvasViewController
    
    // This method is called when the SwiftUI view creates the UIKit view controller.
    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        // Create a new instance of DrawingCanvasViewController.
        let viewController = DrawingCanvasViewController()
        
        // Set the initial drawing data and the closure to handle drawing changes.
        viewController.drawingData = data
        
        // Closure to handle drawing changes. Updates the corresponding CoreData entity.
        viewController.drawingChanged = { updatedData in
            // Update CoreData with the latest drawing data.
            let request: NSFetchRequest<Drawing> = Drawing.fetchRequest()
            
            // Create a predicate to find the Drawing entity with the specified ID. The %@ in the format string is a placeholder that gets replaced with the actual value (id in this case).
            let predicate = NSPredicate(format: "id == %@", id as CVarArg)
            request.predicate = predicate
            
            do {
                // Fetch the corresponding Drawing entity from CoreData.
                let result = try viewContext.fetch(request)
                
                // Update the canvasData attribute of the Drawing entity with the new data.
                let obj = result.first
                obj?.setValue(updatedData, forKey: "canvasData")
                
                do {
                    // Save the changes to CoreData.
                    try viewContext.save()
                } catch {
                    // Print an error message if there's an issue with saving.
                    print("Error saving CoreData changes:", error)
                }
            } catch {
                // Print an error message if there's an issue with fetching the entity.
                print("Error fetching CoreData entity:", error)
            }
        }
        
        // Return the configured UIKit view controller.
        return viewController
    }
}
