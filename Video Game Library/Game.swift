//
//  Game.swift
//  Video Game Library
//
//  Created by Carter West on 9/10/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Game {
    let name: String
    let releasedDate: Date
    let description: String
    let genre: String
    let price: Double
    var checkedIn: Bool
    var dueDate: Date?
    let rating: String
    
    init(name: String, releasedDate: Date, description: String, genre: String, price: Double, checkedIn: Bool, dueDate: Date, rating: String) {
        self.name = name
        self.releasedDate = releasedDate
        self.description = description
        self.genre = genre
        self.price = price
        self.checkedIn = checkedIn
        self.rating = rating
        
    }
}
