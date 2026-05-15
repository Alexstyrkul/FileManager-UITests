import XCTest

class SetPasswordScreen: AppScreen {

    var firstPasswordTextField: XCUIElement { app.secureTextFields["setPasswordFirstTextField"] }
    var repeatPasswordTextField: XCUIElement { app.secureTextFields["setPasswordRepeatTextField"] }
    var setPasswordButton: XCUIElement { app.buttons["setPasswordButton"] }

    var isVisible: Bool { setPasswordButton.waitForExistence(timeout: 5) }

    func setPassword(_ password: String) {
        XCTAssertTrue(setPasswordButton.waitForExistence(timeout: 5))
        firstPasswordTextField.tap()
        firstPasswordTextField.typeText(password)
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText(password)
        setPasswordButton.tap()
    }
}
