import SwiftUI

@Observable
class FileEditorViewModel{
    var folderURL: URL? = nil {
        willSet{
            
                if didAccess{
                    folderURL?.stopAccessingSecurityScopedResource()
                didAccess = false
                folderContents = []
            }
        }
    }
    var folderContents: [URL] = []
    var didAccess: Bool = false
    
    init(){
        
    }
    
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
            var urlContents = try fileManager.contentsOfDirectory(at: folder, includingPropertiesForKeys: [], options: [])
            // can see hidden files
            urlContents = sortURLAlphaIncreasing(urls: urlContents) 
            
            self.folderContents = urlContents
        }catch{
            print("Error reading directory:  \(error.localizedDescription)")
            self.folderContents = []
        }
    }
    func sortURLAlphaIncreasing(urls: [URL])->[URL]{
        return urls.sorted{$0.lastPathComponent < $1.lastPathComponent}
    }
}
