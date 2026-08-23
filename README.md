# iPadPackageBrowser

A SwiftUI file browser for iPad.

I built this to make it easier to work with Swift Package Manager
(.swiftpm) projects created in Swift Playgrounds on iPad.

## What it does

- Browse folders and nested folders
- Browse Swift Package Manager packages
- Identify files, folders and packages
- Display hidden files
- Drag individual files into other apps
- Transfer files to Working Copy

## Why I built it

I develop Swift projects on iPad using Swift Playgrounds and use
Working Copy as my Git client.

Swift Playgrounds makes it difficult to replace individual files in
an existing repository without nesting the whole `.swiftpm` package.
This app lets me browse the package and drag individual files directly
into Working Copy.

## Technologies

- Swift
- SwiftUI
- FileManager
- Security-scoped resources
- Core Transferable
- Drag and drop