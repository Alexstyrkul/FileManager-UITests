import XCTest

class FileListScreen: AppScreen {

    var tableView: XCUIElement { app.tables["folderTableView"] }
    var addDirectoryButton: XCUIElement { app.buttons["addDirectoryButton"] }
    var addPhotoButton: XCUIElement { app.buttons["addPhotoButton"] }

    func tapAddDirectoryButton() -> FileListScreen {
        addDirectoryButton.tap()
        return self
    }

    func tapAddPhotoButton() -> FileListScreen {
        addPhotoButton.tap()
        return self
    }

    func fileExists(named name: String) -> Bool {
        tableView.cells.staticTexts[name].exists
    }
}
