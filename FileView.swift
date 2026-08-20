import SwiftUI


struct FileView: View{
    var nextFile: URL
    @State var didAccess: Bool = false
    
    var body: some View{
        
        HStack{
            
            Text(didAccess ? "Accessed" : "Not Accessed")
                        
            let name = nextFile.lastPathComponent
            Label(name, systemImage: "document")
                .draggable(nextFile){
                    
                    Label(name, systemImage: "shippingbox.fill")}
                .onAppear{
                    didAccess = nextFile.startAccessingSecurityScopedResource()
                }
                .onDisappear{
                    if didAccess{
                        nextFile.stopAccessingSecurityScopedResource()
                    }
                }
        }
    }
}
