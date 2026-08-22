import SwiftUI
import CoreTransferable
import UniformTypeIdentifiers

struct DraggableFile: Transferable{
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation{
        FileRepresentation(exportedContentType: .data, exporting: {file in SentTransferredFile(file.url)})
    }
}
