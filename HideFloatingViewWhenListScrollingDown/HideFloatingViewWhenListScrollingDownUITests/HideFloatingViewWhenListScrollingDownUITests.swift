import XCTest

final class HideFloatingViewWhenListScrollingDownUITests: XCTestCase {

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        

        let item1Element = app.scrollViews.otherElements.containing(.staticText, identifier:"Item 1").element
        
        item1Element.swipeUp()
        item1Element.swipeUp()

        item1Element.swipeDown()
        item1Element.swipeDown()
        
        item1Element.swipeUp()
        item1Element.swipeUp()
        
        item1Element.swipeDown()
        item1Element.swipeDown()

        item1Element.tap()
    }
}
