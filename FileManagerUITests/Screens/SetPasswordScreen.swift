import XCTest

final class SetPasswordScreen: AppScreen {

    var firstPasswordTextField: XCUIElement { app.secureTextFields["setPasswordFirstTextField"] }
    var repeatPasswordTextField: XCUIElement { app.secureTextFields["setPasswordRepeatTextField"] }
    var setPasswordButton: XCUIElement { app.buttons["setPasswordButton"] }

    func waitForScreen() {
        waitForScreen(element: setPasswordButton)
    }

    func setPassword(_ password: String) {
        waitForScreen()
        firstPasswordTextField.tap()
        firstPasswordTextField.typeText(password)
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText(password)
        setPasswordButton.tap()
    }
}
