//
//  Game.swift
//  Video Game Library
//
//  Created by Carter West on 9/10/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Game { //Making the game class for us to have a template for which to add games
    
    //Making properties for the games we will be adding
    let name: String
    var checkedIn: Bool = true
    var dueDate: Date?
    var genre: String
    var rating: String
    var price: Double
   
    //Initializing properties so that we can call the class and enter certain values for properties as parameters for the game.
    init(name: String, genre: String, rating: String, price: Double) {
        self.name = name
        self.genre = genre
        self.rating = rating
        self.price = price

        
    }
}
