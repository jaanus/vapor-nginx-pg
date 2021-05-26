//
//  File.swift
//  
//
//  Created by Jaanus Kase on 25.05.2021.
//

import XCTVapor
import App

extension Application {
  static func testable() throws -> Application {
    let app = Application(.testing)
    try configure(app)
    
    try app.autoRevert().wait()
    try app.autoMigrate().wait()

    return app
  }
}
