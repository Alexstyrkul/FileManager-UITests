import XCTest

final class LoginTests: BaseTest {

    func testSetPasswordScreenAppearsOnFirstLaunch() {
        XCTContext.runActivity(named: "Verify set password screen elements are visible") { _ in
            let screen = SetPasswordScreen(app: app)
            screen.waitForScreen()
            XCTAssertTrue(screen.firstPasswordTextField.exists, "First password field is missing")
            XCTAssertTrue(screen.repeatPasswordTextField.exists, "Repeat password field is missing")
            XCTAssertTrue(screen.setPasswordButton.exists, "Set Password button is missing")
        }
    }

    func testSettingPasswordNavigatesToFileList() {
        XCTContext.runActivity(named: "Set password and verify file list appears") { _ in
            let fileList = navigateToFileList()
            XCTAssertTrue(fileList.tableView.exists, "File list table view should be visible after login")
        }
    }

    func testLoginScreenAppearsAfterPasswordIsSet() {
        XCTContext.runActivity(named: "Set password, restart app without UI_TESTING, verify login screen") { _ in
            navigateToFileList()
            app.terminate()
            app.launchArguments = []
            app.launch()

            let loginScreen = LoginScreen(app: app)
            loginScreen.waitForScreen()
            XCTAssertTrue(loginScreen.loginButton.exists, "Login button should be visible on relaunch")
        }
    }
}
