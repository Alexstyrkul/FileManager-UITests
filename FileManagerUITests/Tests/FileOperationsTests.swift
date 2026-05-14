import XCTest

final class FileOperationsTests: BaseTest {

    func testAddButtonIsVisible() {
        let screen = FileListScreen(app: app)
        XCTAssertTrue(screen.addButton.exists)
    }

    func testEditButtonIsVisible() {
        let screen = FileListScreen(app: app)
        XCTAssertTrue(screen.editButton.exists)
    }

    func testTapAddButtonShowsCreationUI() {
        let screen = FileListScreen(app: app).tapAddButton()
        let alert = app.alerts.firstMatch
        let sheet = app.sheets.firstMatch
        XCTAssertTrue(alert.exists || sheet.exists, "Expected creation UI to appear")
    }
}
