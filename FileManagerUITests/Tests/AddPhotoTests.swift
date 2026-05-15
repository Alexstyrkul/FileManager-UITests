import XCTest

final class AddPhotoTests: BaseTest {

    func testAddPhotoButtonIsVisibleOnFileList() {
        let fileList = navigateToFileList()
        XCTAssertTrue(fileList.addPhotoButton.exists)
    }

    func testTappingAddPhotoButtonOpensPicker() {
        let fileList = navigateToFileList()
        fileList.tapAddPhotoButton()

        // Обрабатываем системный запрос доступа к фото, если появился
        let permissionAlert = app.alerts.firstMatch
        if permissionAlert.waitForExistence(timeout: 3) {
            permissionAlert.buttons.element(boundBy: 0).tap()
        }

        // UIImagePickerController открывает навигационный контроллер с фото
        XCTAssertTrue(app.navigationBars.firstMatch.waitForExistence(timeout: 5))
    }
}
