import XCTest

final class NavigationTests: BaseTest {

    func testFileListIsDisplayedOnLaunch() {
        let screen = FileListScreen(app: app)
        XCTAssertTrue(screen.fileList.exists)
    }

    func testTapFileOpensDetailScreen() {
        let fileList = FileListScreen(app: app)
        guard fileList.fileList.cells.count > 0 else {
            XCTSkip("No files available to navigate into")
        }
        let firstCell = fileList.fileList.cells.firstMatch
        let fileName = firstCell.staticTexts.firstMatch.label
        let detail = fileList.tapFile(named: fileName)
        XCTAssertTrue(detail.fileNameLabel.exists)
    }

    func testBackNavigationReturnsToFileList() {
        let fileList = FileListScreen(app: app)
        guard fileList.fileList.cells.count > 0 else {
            XCTSkip("No files available to navigate into")
        }
        let firstCell = fileList.fileList.cells.firstMatch
        let fileName = firstCell.staticTexts.firstMatch.label
        let detail = fileList.tapFile(named: fileName)
        let backToList = detail.tapBack()
        XCTAssertTrue(backToList.fileList.exists)
    }
}
