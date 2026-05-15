import XCTest

final class AddFolderTests: BaseTest {

    func testAddDirectoryButtonIsVisibleOnFileList() {
        XCTContext.runActivity(named: "Verify add directory button is present") { _ in
            let fileList = navigateToFileList()
            XCTAssertTrue(fileList.addDirectoryButton.exists, "Add directory button should be visible in navigation bar")
        }
    }

    func testTappingAddDirectoryButtonShowsAlert() {
        XCTContext.runActivity(named: "Tap add directory button and verify alert appears") { _ in
            let fileList = navigateToFileList()
            fileList.tapAddDirectoryButton()
            XCTAssertTrue(
                app.alerts.firstMatch.waitForExistence(timeout: 3),
                "Alert for entering directory name should appear"
            )
        }
    }

    func testAddingFolderWithValidNameAppearsInList() {
        let folderName = "TestFolder"

        XCTContext.runActivity(named: "Navigate to file list") { _ in
            navigateToFileList()
        }

        XCTContext.runActivity(named: "Tap add directory and enter folder name") { _ in
            let fileList = FileListScreen(app: app)
            fileList.tapAddDirectoryButton()
            let alert = app.alerts.firstMatch
            XCTAssertTrue(alert.waitForExistence(timeout: 3), "Directory name alert did not appear")
            alert.textFields.firstMatch.typeText(folderName)
            alert.buttons["Submit"].tap()
        }

        XCTContext.runActivity(named: "Verify new folder appears in the list") { _ in
            let fileList = FileListScreen(app: app)
            XCTAssertTrue(
                fileList.fileExists(named: folderName),
                "Folder '\(folderName)' should appear in the file list after creation"
            )
        }
    }

    func testAddingFolderWithEmptyNameShowsError() {
        XCTContext.runActivity(named: "Submit empty folder name and verify error alert") { _ in
            let fileList = navigateToFileList()
            fileList.tapAddDirectoryButton()
            let alert = app.alerts.firstMatch
            XCTAssertTrue(alert.waitForExistence(timeout: 3), "Directory name alert did not appear")
            alert.buttons["Submit"].tap()
            XCTAssertTrue(
                app.alerts.firstMatch.waitForExistence(timeout: 3),
                "Error alert should appear when submitting an empty folder name"
            )
        }
    }
}
