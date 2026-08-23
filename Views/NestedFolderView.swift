import SwiftUI

struct NestedFolderView: View{
    @Environment(FileEditorViewModel.self) private var model
    
    var nestedFolderURL: URL 
    
    var body: some View{
        List{
            
            let currentFolderContents = model.getFolderContents(url: nestedFolderURL)
            if currentFolderContents.isEmpty{
                HStack{
                    Label(" No files", systemImage: "document")
                }
            }
            ForEach(currentFolderContents, id: \.self){nextFile 
                in 
                HStack{
                    
                    
                    let name = nextFile.lastPathComponent
                    
                    let urlType: FolderOrFile = FolderOrFile.urlType(url: nextFile)
                    
                    if urlType == .folder || urlType == .package{
                        NavigationLink(value: nextFile, label:
                                        {
                            Label(name, systemImage: urlType.urlImage)
                                .draggable(DraggableFile(url: nextFile)){
                                    
                                    Label(name, systemImage: "shippingbox.fill")}
                            
                        })
                    }else{
                        Label(name, systemImage: urlType.urlImage)
                            .draggable(DraggableFile(url: nextFile)){
                                
                                Label(name, systemImage: "shippingbox.fill")}
                    }
                    
                    
                }
            }
        }
        
    }
}
