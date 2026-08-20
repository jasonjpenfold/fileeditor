import SwiftUI


struct FileView: View{
    @Environment(FileEditorViewModel.self) private var model
    var nextFile: URL
    
    
    var body: some View{
        
        HStack{
            
            Text(model.didAccess ? "Accessed" : "Not Accessed")
                        
            let name = nextFile.lastPathComponent
            Label(name, systemImage: "document")
                .draggable(DraggableFile(url: nextFile)){
                    
                    Label(name, systemImage: "shippingbox.fill")}
                
                
                
        }
    }
}
