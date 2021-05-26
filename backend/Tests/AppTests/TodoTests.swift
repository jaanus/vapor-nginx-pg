//
//  File.swift
//  
//
//  Created by Jaanus Kase on 25.05.2021.
//

@testable import App
import XCTVapor

final class TodoTests: XCTestCase {

    var app: Application!
    
    override func setUpWithError() throws {
      app = try Application.testable()
    }
 
    override func tearDownWithError() throws {
      app.shutdown()
    }
    
    func testThatItFailsWithoutParameters() throws {
        try app.test(.POST, "todos", afterResponse: { res in
            XCTAssertEqual(res.status, .unsupportedMediaType)
        })
    }
    
    func testThatItFailsWithWrongParameters() throws {
        try app.test(.POST, "todos", beforeRequest: { req in
            try req.content.encode(["badTitle": "some todo"])
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        })
    }
    
    func testThatItCreatesTodo() throws {
        try app.test(.POST, "todos", beforeRequest: { req in
            try req.content.encode(["title": "some todo"])
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .created)
            let todo = try res.content.decode(Todo.self)
            XCTAssertEqual(todo.title, "some todo")
        })
    }
}
