//
//  main.swift
//  Video Game Library
//
//  Created by Carter West on 9/10/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

//Setting up date variables for check in and check out functions in main.swift for universal use, which is very annoying becuase dates are stupid.
let calendar = Calendar.current
let currentDate = Date()
let dateFormatter = DateFormatter()
let dueDate = calendar.date(byAdding: .weekOfMonth, value: 2, to: currentDate)
dateFormatter.dateFormat = "MMM d, yyyy"
let currentDateDisplay = dateFormatter.string(from: currentDate)
let displayDueDate = dateFormatter.string(from: dueDate!)

//Initializing the Library class as myLibrary in order to call functions in the Menu file for functionailty.
let myLibrary = Library()
var checkedOutGamesArray: [Game] = []

//Greeting the user
print("Welcome to the Video Game Library\n")
//Initializing Menu for the user to see the menu and it's options.
let libraryMenu = Menu()

//Setting up repeat loop that the enitre library will run off of.
var runningLibrary = true

//Showing the user the menu
libraryMenu.printMenu()

//Prompting the user for which option they would like to choose.
 print("What would you like to do?")

repeat {
    
    let userInput = libraryMenu.getInput() //Storing the get input function into a variable called userInput.
    
    libraryMenu.handleInput(userInput) //This function takes the user's input as parameters and functions based on the response. This function includes a switch statement where the enitre librarie's function will be based off of.
    
    
} while runningLibrary == true //Code will break from this repeat loop if runningLibrary ever is == false.

if runningLibrary == false { //Once runningLibrary == false, the program will end with exit code 0.
    exit(0)
}


