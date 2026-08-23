import SwiftUI

struct ListView: View{
    @Environment(FileEditorViewModel.self) private var model
    
    var body: some View{
        List{
            NavigationLink(value: 1, label: {Text("Test")})
            
            
            if model.folderContents.isEmpty{
                HStack{
                    Label(" No files", systemImage: "document")
                }
                            }
            ForEach(model.folderContents, id: \.self){nextFile 
                 in 
                FileView(nextFile: nextFile)
            }
        }.navigationDestination(for: Int.self){
            number in 
            TestView(number: number)
        }
        .navigationDestination(for: URL.self){
            nestedFolderURL in 
            
            NestedFolderView(nestedFolderURL: nestedFolderURL)
        }
    }
}
