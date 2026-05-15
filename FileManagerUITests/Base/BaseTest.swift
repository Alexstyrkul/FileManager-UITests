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

    // Устанавливает пароль при первом запуске и попадает на экран файлов.
    // При UI_TESTING кейчейн очищается, поэтому всегда стартует с SetPasswordScreen.
    // После первой установки пароля приложение сразу переходит к файловому менеджеру.
    @discardableResult
    func navigateToFileList() -> FileListScreen {
        let setPasswordScreen = SetPasswordScreen(app: app)
        setPasswordScreen.setPassword(BaseTest.testPassword)
        let fileList = FileListScreen(app: app)
        XCTAssertTrue(fileList.tableView.waitForExistence(timeout: 5))
        return fileList
    }
}
