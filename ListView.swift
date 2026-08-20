import SwiftUI

struct ListView: View{
    @Environment(FileEditorViewModel.self) private var model
    
    var body: some View{
        List{
            if model.folderContents.isEmpty{
                HStack{
                    Label(" No files", systemImage: "document")
                }
                            }
            ForEach(model.folderContents, id: \.self){nextFile 
                 in 
                FileView(nextFile: nextFile)
            }
        }
    }
}
