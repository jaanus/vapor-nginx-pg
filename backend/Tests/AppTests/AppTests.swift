@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    var app: Application!
    
    override func setUpWithError() throws {
      app = try Application.testable()
    }
 
    override func tearDownWithError() throws {
      app.shutdown()
    }
    
    func testHelloWorld() throws {
        
        try app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
}
