# FileManager UITests

XCUITest automation suite for the open-source [iOS FileManager](https://github.com/lord-anonymoose/FileManager) app.

## App Under Test

**FileManager** — a UIKit-based iOS file manager that supports:
- Password-protected login
- File and folder navigation
- Create folders, add photos from gallery
- Delete files with swipe gesture

## Tech Stack

- **Language**: Swift
- **Framework**: XCUITest (Apple native UI testing)
- **Pattern**: Page Object Model
- **IDE**: Xcode

## Project Structure

```
FileManagerApp/              ← app source code (under test)
FileManagerUITests/
├── Base/
│   ├── BaseTest.swift       # Base test class with setup/teardown and shared helpers
│   └── AppScreen.swift      # Base Page Object with shared wait logic
├── Screens/
│   ├── FileListScreen.swift    # Page Object — file list screen
│   ├── LoginScreen.swift       # Page Object — login screen
│   └── SetPasswordScreen.swift # Page Object — set password screen
└── Tests/
    ├── LoginTests.swift         # Login and password setup flow
    ├── AddFolderTests.swift     # Create folder, empty name validation
    └── AddPhotoTests.swift      # Open photo picker from file list
TestPlans/
└── FileManagerUITests.xctestplan
```

## Key Practices

- Accessibility identifiers set on all interactive elements
- `UI_TESTING` launch argument clears Keychain for a clean test state
- `XCTContext.runActivity` for readable test report steps
- Failure messages on all `XCTAssert` calls
- `waitForExistence` used consistently for async UI

## Setup

1. Open `FileManagerApp/FileManager.xcodeproj` in Xcode
2. Select the `FileManager` scheme
3. Run tests via `Cmd + U`
