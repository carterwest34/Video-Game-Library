//
//  Menu.swift
//  Video Game Library
//
//  Created by Carter West on 9/11/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation



class Menu {
    
   
    let myLibrary = Library() //Initializing the library class as a constant called myLibrary in order to use functions in Menu.swift, specifically, our switch statement function, handleInput.
   
        func getInput() -> Int { //Setting up function for the menu to prompt the user for input.
            var userInput = Int(readLine()!)
            while userInput == nil || userInput! < 1 || userInput! > 8 { //Input validation, guarding against empty and out of range answers
                print("Please enter a valid answer")
                userInput = Int(readLine()!)
                handleInput(userInput!)  //Calling our handleInput function, which is where our entire library will function in a switch starement
            }
            return userInput! //Return the userinput after validation
        }
    
    
    func printMenu() {
        //This is the menu that will display on the console that the user will see and displays the options to the user
        print("""
  ----------------------------------------------------
  |         VIDEO GAME LIBRARY MENU LIST:            |
  |               1) Add Game                        |
  |               2) Remove Game                     |
  |               3) List Available Games            |
  |               4) Check Out Game                  |
  |               5) Check In Game                   |
  |               6) List Checked Out Games          |
  |               7) Print Menu                      |
  |               8) Quit                            |
  ----------------------------------------------------
""")
    }
    //This is our switch statement where the enitre library will function after the inital printing of the menu
    func handleInput(_ userInput: Int) {
        switch userInput {
            //According to which input (1-8) the user picks, certain print statements and functions will be called that are stored in our library file, which is where all our functions are made. The print statements under each case is to inform the user of their choice. 
        case 1:
            print("You have chosen to add a game.")
            //Call libraries add game function
            myLibrary.addGame()
            myLibrary.postUseOptions()
        case 2:
            print("You have chosen to remove a game")
            //Call libraries remove a game function
            print("Here are the games you can remove:")
            myLibrary.listAvailableGames()
            myLibrary.removeGame()
            myLibrary.postUseOptions()
        case 3:
            print("You have chosen to see the list of available games.")
            //Call libraries see list function
            myLibrary.listAvailableGames()
            myLibrary.postUseOptions()
        case 4:
            print("You have chosen to check out a game.")
            //Call libraries check out game function
            print("Here are the list of games that are available for checkout.")
            myLibrary.listAvailableGames() //Lists available games so that the user has an idea of what games are available for checkout as well as a visual index. 
            myLibrary.checkOut()
            myLibrary.postUseOptions()
        case 5:
            print("You have chosen to check in a game.")
            //Call libraries check in game function
            myLibrary.checkIn()
            myLibrary.postUseOptions()
        case 6:
            print("You have chosen to see the list of checked out games.")
            //Call libraries see list of checked out gaames function
            myLibrary.listCheckedOutGames()
            myLibrary.postUseOptions()
        case 7:
            print("You have chosen to see the menu options.")
            //Call libraries quit see menu application
            myLibrary.seeMenuOptions()
            myLibrary.postUseOptions()
        case 8:
            print("Thanks for using the application.")
            runningLibrary = false
            //Call libraries quit application function
       
        default:
            break
        }
    }
    
    
}

