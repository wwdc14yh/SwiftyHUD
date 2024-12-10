import XCTest
@testable import SwiftyHUD

final class SwiftyHUDTests: XCTestCase {
    func testExample() async throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        let hud = await SwiftyHUD.activity(.default, message: .default(text: "Activity"), animation: .default, style: .default)
        
        await SwiftyHUD.show(hud, animation: .default, duration: 0.2, completion: nil)
        
    }
}

