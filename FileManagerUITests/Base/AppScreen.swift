import XCTest

class AppScreen {

    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func waitForScreen(element: XCUIElement, timeout: TimeInterval = 5) {
        XCTAssertTrue(
            element.waitForExistence(timeout: timeout),
            "\(type(of: self)) did not appear within \(timeout) seconds"
        )
    }
}
