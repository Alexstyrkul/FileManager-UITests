import XCTest

final class AddPhotoTests: BaseTest {

    func testAddPhotoButtonIsVisibleOnFileList() {
        XCTContext.runActivity(named: "Verify add photo button is present") { _ in
            let fileList = navigateToFileList()
            XCTAssertTrue(fileList.addPhotoButton.exists, "Add photo button should be visible in navigation bar")
        }
    }

    func testTappingAddPhotoButtonOpensPicker() {
        XCTContext.runActivity(named: "Navigate to file list") { _ in
            navigateToFileList()
        }

        XCTContext.runActivity(named: "Tap add photo button") { _ in
            let fileList = FileListScreen(app: app)
            fileList.tapAddPhotoButton()
        }

        XCTContext.runActivity(named: "Handle photo library permission alert if presented") { _ in
            let permissionAlert = app.alerts.firstMatch
            if permissionAlert.waitForExistence(timeout: 3) {
                permissionAlert.buttons.element(boundBy: 0).tap()
            }
        }

        XCTContext.runActivity(named: "Verify photo picker navigation bar is visible") { _ in
            XCTAssertTrue(
                app.navigationBars.firstMatch.waitForExistence(timeout: 5),
                "Photo picker should be presented with a navigation bar"
            )
        }
    }
}
