//
//  Movie.swift
//  
//
//  Created by Raphael Torquato on 20/05/23.
//

import Foundation
import Vapor
import Fluent

final class Movie:  Model {
    
    static let schema: String = "movies"
    
    /* Creating ID unique Key */
    @ID(key: .id)
    var id: UUID?
    
    /*  Creating a column named title   */
    @Field(key: "title")
    var title: String
    
    init() {    }
    
    init(id:UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
}


