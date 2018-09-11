//
//  Menu.swift
//  Video Game Library
//
//  Created by Carter West on 9/11/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation



class Menu {
    
    var shouldQuit = false
    
    func go() {
        //This function is going to handle making the menu run. It will display the menu and take the user input until the user wishes to quit the application.
        while !shouldQuit {
            printMenu()
            quit()
        }
        func getInput() -> String {
            let userInput = readLine()
            while userInput == nil || userInput == "" {
                print("Please enter a valid answer")
                _ = readLine()
            }
            return userInput!
        }
    }
    
    func printMenu() {
        print("""
  ----------------------------------------------------
  |         VIDEO GAME LIBRARY MENU LIST:            |
  |               1) Add Game                        |
  |               2) Remove Game                     |
  |               3) List Available Games            |
  |               4) Check Out Game                  |
  |               5) Check In Game                   |
  |               6) List Checked Out Games          |
  |               7) Quit                            |
  ----------------------------------------------------
""")
    }
    func quit() {
        //This function will be called when the user is ready to quit the application
        shouldQuit = true
        print("Thanks for using the application")
    }
}

