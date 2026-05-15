import XCTest

final class LoginTests: BaseTest {

    func testSetPasswordScreenAppearsOnFirstLaunch() {
        let screen = SetPasswordScreen(app: app)
        XCTAssertTrue(screen.isVisible)
        XCTAssertTrue(screen.firstPasswordTextField.exists)
        XCTAssertTrue(screen.repeatPasswordTextField.exists)
        XCTAssertTrue(screen.setPasswordButton.exists)
    }

    func testSettingPasswordNavigatesToFileList() {
        let fileList = navigateToFileList()
        XCTAssertTrue(fileList.tableView.exists)
    }

    func testLoginScreenAppearsAfterPasswordIsSet() {
        // Устанавливаем пароль, попадаем на файловый список, перезапускаем без UI_TESTING
        navigateToFileList()
        app.terminate()

        app.launchArguments = []
        app.launch()

        let loginScreen = LoginScreen(app: app)
        XCTAssertTrue(loginScreen.isVisible)
    }
}
