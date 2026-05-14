# FileManager UITests

XCUITest automation suite for the open-source [iOS FileManager](https://github.com/lord-anonymoose/FileManager) app.

## App Under Test

**FileManager** — a Swift/SwiftUI-based iOS file manager that supports:
- File navigation across directories
- Create, delete, move, and rename files and directories
- File preview for supported formats

## Tech Stack

- **Language**: Swift
- **Framework**: XCUITest (Apple native UI testing)
- **IDE**: Xcode

## Project Structure

```
FileManager-UITests/
├── FileManagerUITests/
│   ├── Base/
│   │   ├── BaseTest.swift         # Base test class (setup/teardown)
│   │   └── AppScreen.swift        # Base screen class (Page Object)
│   ├── Screens/
│   │   ├── FileListScreen.swift   # Page Object for file list screen
│   │   └── FileDetailScreen.swift # Page Object for file detail screen
│   └── Tests/
│       ├── NavigationTests.swift  # Tests for file navigation
│       ├── FileOperationsTests.swift # Tests for create/delete/rename
│       └── FilePreviewTests.swift # Tests for file preview
└── README.md
```

## Setup

1. Clone [FileManager](https://github.com/lord-anonymoose/FileManager) app
2. Open in Xcode and add a UITest target
3. Copy test files from `FileManagerUITests/` into the target
4. Run tests via `Cmd + U`
