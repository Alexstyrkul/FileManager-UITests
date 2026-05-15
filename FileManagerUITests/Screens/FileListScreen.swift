import XCTest

final class FileListScreen: AppScreen {

    var tableView: XCUIElement { app.tables["folderTableView"] }
    var addDirectoryButton: XCUIElement { app.buttons["addDirectoryButton"] }
    var addPhotoButton: XCUIElement { app.buttons["addPhotoButton"] }

    func waitForScreen() {
        waitForScreen(element: tableView)
    }

    @discardableResult
    func tapAddDirectoryButton() -> FileListScreen {
        addDirectoryButton.tap()
        return self
    }

    @discardableResult
    func tapAddPhotoButton() -> FileListScreen {
        addPhotoButton.tap()
        return self
    }

    func fileExists(named name: String, timeout: TimeInterval = 3) -> Bool {
        tableView.cells.staticTexts[name].waitForExistence(timeout: timeout)
    }
}
