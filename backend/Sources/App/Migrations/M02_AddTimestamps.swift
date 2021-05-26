//
//  M02_AddTimestamps.swift
//  
//
//  Created by Jaanus Kase on 20.05.2021.
//

import Fluent

struct M02_AddTimestamp: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("todos")
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .update()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("todos")
            .deleteField("created_at")
            .deleteField("updated_at")
            .update()
    }
    
}
