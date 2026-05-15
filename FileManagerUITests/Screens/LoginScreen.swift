import XCTest

class LoginScreen: AppScreen {

    var passwordTextField: XCUIElement { app.secureTextFields["loginPasswordTextField"] }
    var loginButton: XCUIElement { app.buttons["loginButton"] }

    var isVisible: Bool { loginButton.waitForExistence(timeout: 5) }

    @discardableResult
    func login(password: String) -> FileListScreen {
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))
        passwordTextField.tap()
        passwordTextField.typeText(password)
        loginButton.tap()
        return FileListScreen(app: app)
    }
}
