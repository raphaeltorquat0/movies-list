import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "peanut.db.elephantsql.com", username: "unncanps", password: "AK9luBO5U3LP5O_BQvUhP4r8KB-BviF7", database: "unncanps"), as: .psql)
    
    /* register migration */
    app.migrations.add(CreateMoviesTableMigration())
    
    // register routes
    try routes(app)
}
