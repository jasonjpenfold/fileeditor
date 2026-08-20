import SwiftUI

@Observable
class FileEditorViewModel{
    var folderURL: URL? = nil
    var folderContents: [URL] = []
    var didAccess: Bool = false
    
    
    func browse(result: Result<[URL],  any Error>){
       
        switch result {
        case .success(let urls):
            print(urls)
            guard let firstUrl = urls.first else{
                print("No folder selected")
                return
            }
            folderURL = firstUrl
            getFolderContents()
            
        case .failure(let error):
            print(error)
        }
        
    }
    func getFolderContents(){
        guard let folder = self.folderURL else {return}
        guard    folder.startAccessingSecurityScopedResource() else {return}
        self.didAccess = true
        
        let fileManager = FileManager.default
        do{
            self.folderContents = try fileManager.contentsOfDirectory(at: folder, includingPropertiesForKeys: [], options: [])
            // can see hidden files
        }catch{
            print("Error reading directory:  \(error.localizedDescription)")
            self.folderContents = []
        }
    }
}
