import SwiftUI

struct ContentView: View {
    
    @Environment(FileEditorViewModel.self) private var model
    @State private var importerIsPresented = false
    var body: some View {
        VStack {
            
            
            Button("Browse"){
                importerIsPresented = true
            }
            .padding()
                .buttonStyle(.glassProminent)
                .shadow(radius: 5)
                .fileImporter(isPresented: $importerIsPresented, allowedContentTypes: [.folder, .package], allowsMultipleSelection: false, onCompletion: model.browse)//(result,error))
        }
        
        let currentFolder = model.folderURL?.lastPathComponent ?? "No folder selected"
        Text("\(currentFolder)")
            .padding()
        
        FolderView()
            .padding()
    }
}
