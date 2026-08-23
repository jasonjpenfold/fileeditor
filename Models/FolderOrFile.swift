import SwiftUI

enum FolderOrFile{
    case folder
    case file 
    case package
    case unknown
    
    static func urlType(url: URL)->FolderOrFile{
        do{
            let urlValues = try url.resourceValues(forKeys: [.isDirectoryKey, .isRegularFileKey, .isPackageKey])
            if urlValues.isPackage == true{
                return .package
            }
            if urlValues.isDirectory == true{
                return .folder
            }
            if urlValues.isRegularFile == true{
                return .file
            }
        }catch{
            return .unknown
        }

        return .unknown
    }
    var urlImage: String{
        switch self{
        case .file:
            return "document"
        case .folder:
            return "folder.fill"
        case .package:
            return "archivebox.fill"
        case .unknown:
            return "questionmark"
        }
    }
}
