import SwiftUI

struct FolderView: View{
    @Environment(FileEditorViewModel.self) private var model
    
    var body: some View{
        List{
            if model.folderContents.isEmpty{
                Text("No files")
            }
            ForEach(model.folderContents, id: \.self){file in 
                Text("\(file)")
            }
        }
    }
}
