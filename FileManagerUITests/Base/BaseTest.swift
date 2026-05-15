import XCTest

class BaseTest: XCTestCase {

    var app: XCUIApplication!
    static let testPassword = "test1234"

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UI_TESTING"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    // Sets password on first launch and navigates to the file list.
    // UI_TESTING clears the keychain, so the app always starts with SetPasswordScreen.
    // After setting a password for the first time, the app navigates directly to the file list.
    @discardableResult
    func navigateToFileList() -> FileListScreen {
        let setPasswordScreen = SetPasswordScreen(app: app)
        setPasswordScreen.setPassword(BaseTest.testPassword)
        let fileList = FileListScreen(app: app)
        XCTAssertTrue(
            fileList.tableView.waitForExistence(timeout: 5),
            "File list table view did not appear after setting password"
        )
        return fileList
    }
}
