import SwiftUI

@main
struct FileEditor: App {
    @State private var model = FileEditorViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
