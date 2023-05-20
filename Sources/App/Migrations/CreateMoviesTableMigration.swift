//
//  CreateMoviesTableMigration.swift
//  
//
//  Created by Raphael Torquato on 20/05/23.
//

import Foundation
import Vapor
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        /* Creating movies table */
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    /* This will run when you undo migration */
    func revert(on database: Database) async throws {
        /* Delete movies table*/
        try await database.schema("movies")
            .delete()
    }
}
