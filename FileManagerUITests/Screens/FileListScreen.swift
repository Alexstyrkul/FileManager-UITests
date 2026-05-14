import XCTest

class FileListScreen: AppScreen {

    var fileList: XCUIElement { app.tables.firstMatch }
    var addButton: XCUIElement { app.navigationBars.buttons["Add"] }
    var editButton: XCUIElement { app.navigationBars.buttons["Edit"] }

    func tapFile(named name: String) -> FileDetailScreen {
        fileList.cells.staticTexts[name].tap()
        return FileDetailScreen(app: app)
    }

    func tapAddButton() -> FileListScreen {
        addButton.tap()
        return self
    }

    func tapEditButton() -> FileListScreen {
        editButton.tap()
        return self
    }

    func fileExists(named name: String) -> Bool {
        fileList.cells.staticTexts[name].exists
    }
}
