import XCTest

final class AddFolderTests: BaseTest {

    func testAddDirectoryButtonIsVisibleOnFileList() {
        let fileList = navigateToFileList()
        XCTAssertTrue(fileList.addDirectoryButton.exists)
    }

    func testTappingAddDirectoryButtonShowsAlert() {
        let fileList = navigateToFileList()
        fileList.tapAddDirectoryButton()
        XCTAssertTrue(app.alerts.firstMatch.waitForExistence(timeout: 3))
    }

    func testAddingFolderWithValidNameAppearsInList() {
        let folderName = "TestFolder"
        let fileList = navigateToFileList()
        fileList.tapAddDirectoryButton()

        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 3))
        alert.textFields.firstMatch.typeText(folderName)
        alert.buttons["Submit"].tap()

        XCTAssertTrue(fileList.fileExists(named: folderName))
    }

    func testAddingFolderWithEmptyNameShowsError() {
        let fileList = navigateToFileList()
        fileList.tapAddDirectoryButton()

        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 3))
        alert.buttons["Submit"].tap()

        XCTAssertTrue(app.alerts.firstMatch.waitForExistence(timeout: 3))
    }
}
