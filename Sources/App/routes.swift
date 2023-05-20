import Vapor

func routes(_ app: Application) throws {
    /* Create movie*/
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    /* Get all movies*/
    app.get("movies") { req async throws in
        let movies = try await Movie.query(on: req.db)
            .all()
        return movies
    }
    
    /* Get movie by id /movies/UUID */
    app.get("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        return movie
    }
    
    /* Delete a movie*/
    app.delete("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        try await movie.delete(on: req.db)
        return movie
    }
    
    /* Update a movie */
    app.put("movies") { req async throws in
        let editedMovie = try req.content.decode(Movie.self)
        /* Movie in the db we want to update */
        guard let movie = try await Movie.find(editedMovie.id, on: req.db) else {
            throw Abort(.badRequest)
        }
        
        movie.title = editedMovie.title
        try await movie.update(on: req.db)
        return movie
    }
}
