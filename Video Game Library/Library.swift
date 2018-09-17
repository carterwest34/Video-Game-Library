//
//  Library.swift
//  Video Game Library
//
//  Created by Carter West on 9/13/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation


class Library { //Making the entire library class in which will be initialized as myLibrary in Menu.swift.
    var gameLibrary: [Game] = []
    
    //This function will be used if the user chooses to add a game to their library
    func addGame() {
        print("What game would you like to add?") //Prompting the user for the name of the game.
        
        var userAddGameInput: String = readLine()! //Creating the variable that will contain the user's answer for the name of the game they wish to add.
        while userAddGameInput == "" {   //Input validation to confirm that the users Input isn't a blank string.
            print("Please add a valid game.")
            userAddGameInput = readLine()! //Re-prompt the user for a valid answer.
        }
        
        print("What genre is this game?")  //Prompting the user for the genre of the game they're adding.
        
        var newGameGenre: String = readLine()! //Creating variable where the user's input for the genre will be stored.
        
        while newGameGenre == "" { //Input validation that confirms the user input isn't an empty string.
            
            print("Please add a valid genre.") //Re-prompting the user for a valid string.
            
            newGameGenre = readLine()! // Calling the readLine variable again to allow user to type.
        }
        
        print("What rating is your game?") //Prompting the user for the rating of the game they're adding.
        
        var newGameRating = readLine()! //Storing the user's input in a variable called newGameRating.
        
        while newGameRating == "" {  //Input validation that confirms the rating the user inputs is a valid string.
            
            print("Please add a valid rating.") //Re-prompting the user for a valid rating.
            
            newGameRating = readLine()! //Calling the user input variable once again.
        }
        
        print("What is the price of your game?") //Propmting the user for the price of their game.
        
        var newGamePrice = Double((readLine())!) //Storing the input of the user for the price in a variable called newGamePrice.
        
        while newGamePrice == nil { //Input validation that ensures that the user input isn't nil or a value other than a double
            
            print("Please add a valid price.") //Re-prompting the user for a valid price of the game they're adding
            
            newGamePrice = Double((readLine())!) // Giving the user the option to put in another value.
            
        }
        
        let newGame = Game(name: userAddGameInput, genre: newGameGenre, rating: newGameRating, price: newGamePrice!) //Initializing the new game that the user is adding as the constant newGame, where the parameters are filled in as the user input. Doing this also adds all the properties at once instead of independently adding each property as the user adds them
        
        gameLibrary.append(newGame) //Adds the all the users input at once through adding newGame to the empty array gameLibrary.
        
        print("You have added \(userAddGameInput)!") //Print statement telling the user that they have successfully added their game.
    }
    
    func listAvailableGames() { //Function that displays a list of available games for checkout with no parameters.
        
        var counter = 1 //Setting up a counter so that we can interpolate it in the for loop so that we can show the games in order (Ex.   1) "Game 1")
        
        while counter <= gameLibrary.count { //Validates that the for loop will not run if the counter ever exceeds the number of elements in the gameLibrary array.
            
            for games in gameLibrary { //For loop that goes through the games in the gameLibrary array and prints them out in a list.
                
                if games.checkedIn { //Ensures that the games will only print out if the games are checked in
                    
                    print("\(counter)) \(games.name)") //Prints "counter) name of the game".
                    
                    counter += 1 //Adds to the counter so that for the second element of the game, it will print "2) name of the second game"
                }
            }
            
        }
        
        if gameLibrary.count == 0 { //Extra feature that prints out there are no games available if there are no elements in the game array.
            print("There are no games available.")
            
        }
    }
    
    func quit() { //Function that simply quits the application. This will be used in case 8 in our handleInput function.
        
        print("Thanks for using the application!") //Notifies the user that the application is quitting by thanking the user for using the application
        
        exit(0) //Exit application with exit code 0
    }
    
    func seeMenuOptions() { //Very simple function in order to display the menu options in case the user wants to see them.
        
        libraryMenu.printMenu() //Calls function that displays the menu, initially used before the switch statement.
    }
    
    func postUseOptions() { //Function that is used after the user completes the function that they chose from in the initial menu display.
        
        print("Want to do something else? (Y/N)") //Prompts the user if they would like to complete another function.
        
        var userAnswer = readLine()!.uppercased() //Stores the user input in a variable that automatically uppercases the input for ease for the programmer.
        
        while userAnswer != "Y" && userAnswer != "N" { //Input validation that says that if the user input doesn't equal a simple yes or no, then they will be prompted to answer again.
            
            print("Please type a valid answer. (Y/N)")
            
            userAnswer = (readLine()?.uppercased())!
        }
        if userAnswer == "Y" { //If the user says they DO want to complete another functon then the menu will be printed again, and prompted asking what they would like to do.
            
            libraryMenu.printMenu() //Calling print menu function.
            
            print("What would you like to do?")
        } else {
            print("Thanks for using the application!") //If the user doesn't want to do anything else, thank the user for using the application and exit with code 0
            exit(0)
        }
        
    }
    
    func removeGame() { //Function that removes a game from game array (myLibrary)
        
        print("What game would you like to remove? (1 = (first game), 2 = (second game), etc...)") //Asking the user what they would like to remove and giving examples of input they should give.
        
        var removeChoice = Int(readLine()!)! - 1 //Store the users input into a variable called removeChoice, and automatically subtract 1 from the input in order tp correlate to the index of the array we will be modifying
        
        let validGameIndex = Array(0..<gameLibrary.count) //Making a variable that sets a valid game index by making an array that can only include values from 0 to the amount of elements in the game library.
        
        while validGameIndex.contains(removeChoice) == false { //Input validation that says if the valid game index doesn't include the removeChoice index value, then they will be prompted to input a valid removeChoice integer.
            
            print("Please choose a valid option.")
            
            removeChoice = Int(readLine()!)! - 1
        }
        
        print("You have removed \(gameLibrary[Int(removeChoice)].name) from your Game Library.") //Notifies user that the game they chose has been successfully removed from the game library
        
        gameLibrary.remove(at: removeChoice) //Finally removes the users index choice from the game library array.
        
    }
    func checkOut() { //Function built for the user to be able to check out games from the library.
        
        print("What game would you like to checkout?") //Prompts the user as to which game they want to checkout
        
        var userCheckOutAnswer = Int(readLine()!)! - 1 //Stores the users input in a variable called userCheckOutAnswer, with 1 automatically subtracted from the response in order to input the variable for the array to successfully run
        
        while userCheckOutAnswer < 0 || userCheckOutAnswer > gameLibrary.count || userCheckOutAnswer == nil { //Input validation that says that if the user check out answer is out of range of the index or the answer is equal to nil, then the user will be prompted to enter a valid index, gives a range of values of index for the user to pick from, and takes in input again.
            
            print("Please enter a valid index. (1-\(gameLibrary.count))")
            userCheckOutAnswer = Int(readLine()!)! - 1
        }
        print("You have checked out \(gameLibrary[userCheckOutAnswer].name)") //Print statememnt that notifies the user that the game they have chosen has been successfully checked out.
        
            checkedOutGamesArray.append(gameLibrary[userCheckOutAnswer]) //Appends the value index of the input to the array of checked out games, of which is available to the user for viewing.
        
            gameLibrary.remove(at: userCheckOutAnswer) //Finally removes the checkout answer from the game library array.
        
            print("You have checked this game out on \(currentDateDisplay). The due date for this game is \(String(describing: displayDueDate)).") //Print statement that visually shows the user that not only has the game been checked out successfully, but it also displays the time of checkout as well as the due date for check in of the game.
    }
    
    func listCheckedOutGames() { //Funciton that shows a list of games checked out by the user.
        
        print("Here's a list of your checked out games:") //Shows the user the list of checked out games using a for loop and a counter variable, similar to how we showed the user the list of checked in games.
        
        var counter = 1
        for index in 0..<checkedOutGamesArray.count
        {
            print("\(counter)) \(checkedOutGamesArray[index].name)")
            counter += 1
        }
        if checkedOutGamesArray.count == 0 {
            print("There are no games currently checked out.")
        }
        
    }
    func checkIn() { //Function that allows the user to check in games that are currently checked out.
        myLibrary.listCheckedOutGames() //First, we call the function that shows the list of checked out games in order to give the user a list to pick from as well as a visual index that goes along with the games.
        
        print("Which game would you like to check in?") //Print statement that asks the user which game they'd like to check in.
        
        var checkInAnswer = Int(readLine()!)! - 1
        while checkInAnswer < 0 || checkInAnswer > checkedOutGamesArray.count - 1 || checkInAnswer == nil { //Validation for the input that says while the user answer (Int) is out of range of the valid index in the checkedOutGamesArray, or the value of the answer is nil, then the user will be prompted to input a valid Int value that corresponds with an index in the array.
            
            print("Please enter a valid index. (1-\(checkedOutGamesArray.count))")
            
            checkInAnswer = Int(readLine()!)! - 1
        }
        print("You have checked in \(checkedOutGamesArray[checkInAnswer].name) on \(currentDateDisplay). The date required to be checked in is \(displayDueDate).") //Print statement that shows that the game has been checked in, gives the value of the date on the date of checkout, and the due date assigned at checkout.
        
        gameLibrary.append(checkedOutGamesArray[checkInAnswer]) //Appends the input of the user from the checkedOutGamesArray to the gameLibrary array. This shows that the game has been checked in, and the game is back in the list of available games, ready to be checked out again.
        
        checkedOutGamesArray.remove(at: checkInAnswer) //Finally, we remove the game that the user chose from the checkedOutGameaArray, this way when the user wants to see the list of currently checked out games, they will no longer see this game. We couldn't have done this earlier because we had to append the game back to the gameLibrary FROM the checkedOutGamesArray first, or else it wouldn't be in the checkOutGamesArray in the first place, if we would've done this command first.
        
    }
}
