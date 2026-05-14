import XCTest

class FileDetailScreen: AppScreen {

    var backButton: XCUIElement { app.navigationBars.buttons.firstMatch }
    var fileNameLabel: XCUIElement { app.navigationBars.staticTexts.firstMatch }
    var deleteButton: XCUIElement { app.buttons["Delete"] }
    var renameButton: XCUIElement { app.buttons["Rename"] }

    func tapBack() -> FileListScreen {
        backButton.tap()
        return FileListScreen(app: app)
    }

    func tapDelete() -> FileListScreen {
        deleteButton.tap()
        return FileListScreen(app: app)
    }
}
