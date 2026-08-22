import SwiftUI


struct FileView: View{
    @Environment(FileEditorViewModel.self) private var model
    var nextFile: URL
    
    
    var body: some View{
        
        HStack{
            
            //Text(model.didAccess ? "Accessed" : "Not Accessed")
            
            let name = nextFile.lastPathComponent
            
            let urlType: FolderOrFile = FolderOrFile.urlType(url: nextFile)
            
            if urlType == .folder || urlType == .package{
                NavigationLink(value: nextFile, label:
                                {
                    Label(name, systemImage: urlType.urlImage)
                        .draggable(DraggableFile(url: nextFile)){
                            
                            Label(name, systemImage: "shippingbox.fill")}
                    
                })
            }
            
                
        }
    }
    
}
