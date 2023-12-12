# PencilKit-App-CoreData

**Overview:**
This drawing app is a creative tool designed for iOS, allowing users to express their ideas, sketches, and drawings digitally. Developed using Swift, UIKit, PencilKit, and CoreData, the app provides a seamless and intuitive drawing experience.

**Key Frameworks:**
1. **CoreData:**
   - Persistent data storage for user drawings.
   - Entities include `canvasData`, `title`, and `id`.

2. **PencilKit:**
   - Implements the drawing canvas for a natural drawing experience.
   - Supports Apple Pencil and touch input.

3. **Swift and UIKit:**
   - Developed using Swift, Apple's modern programming language.
   - Utilizes UIKit for creating the user interface.

**Key Functionalities:**
1. **Canvas Creation:**
   - Create a new canvas for fresh drawings.
   - Each canvas has a unique identifier (`UUID`).

2. **Canvas Selection:**
   - View and select existing canvases.
   - Navigate to drawings by tapping on canvas titles.

3. **Drawing Canvas:**
   - Powered by PencilKit for a lifelike drawing experience.
   - Supports drawing, sketching, and creative expression.

4. **Canvas Saving:**
   - Auto-save changes to CoreData for persistent storage.
   - Updates `canvasData` attribute in the associated `Drawing` entity.

5. **Canvas Deletion:**
   - Delete canvases directly from the main view.
   - Removes corresponding `Drawing` entity from CoreData.

6. **Adding New Canvases:**
   - Add new canvases via the "Add Canvas" button.
   - Input a title for the new canvas using AddNewCanvasView.

7. **User-Friendly Interface:**
   - Clean and accessible interface for users of all levels.
   - Navigation facilitated by SwiftUI's navigation views and UIKit components.

**Conclusion:**
This drawing app combines the power of Swift, UIKit, PencilKit, and CoreData to deliver a seamless and enjoyable digital drawing experience. Whether users are sketching ideas, creating art, or jotting down notes, this app provides a versatile platform for unleashing creativity on iOS devices.

Happy drawing!
