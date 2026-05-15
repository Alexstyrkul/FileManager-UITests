import XCTest

final class LoginScreen: AppScreen {

    var passwordTextField: XCUIElement { app.secureTextFields["loginPasswordTextField"] }
    var loginButton: XCUIElement { app.buttons["loginButton"] }

    func waitForScreen() {
        waitForScreen(element: loginButton)
    }

    @discardableResult
    func login(password: String) -> FileListScreen {
        waitForScreen()
        passwordTextField.tap()
        passwordTextField.typeText(password)
        loginButton.tap()
        return FileListScreen(app: app)
    }
}
