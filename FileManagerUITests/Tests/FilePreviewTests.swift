import XCTest

final class FilePreviewTests: BaseTest {

    func testOpeningFileShowsDetailView() {
        let fileList = FileListScreen(app: app)
        guard fileList.fileList.cells.count > 0 else {
            XCTSkip("No files available for preview test")
        }
        let firstCell = fileList.fileList.cells.firstMatch
        let fileName = firstCell.staticTexts.firstMatch.label
        let detail = fileList.tapFile(named: fileName)
        XCTAssertTrue(detail.fileNameLabel.label == fileName)
    }
}
