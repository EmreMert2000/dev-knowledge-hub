//
//  EnumAndStructures.swift
//  SwiftUICard
//
//  Created by Emre Mert on 17.11.2025.
//
import SwiftUI

enum Suits{
    case spades, hearts, diamonds, clubs
    
    func simpleDesc()->String{
        switch self{
        case.spades:
            return "Spades"
        case.hearts:
            return "Hearts"
        case.diamonds:
            return "Diamonds"
        case.clubs
            return "Clubs"
        }
    
    }
    
    
    //Async Data in swift
    
    func fetchUserID(from server: String) async -> Int {
        if server == "primary" {
            return 97
        }
        return 501
    }
    func connectUser(to server: String) async {
        async let userID = fetchUserID(from: server)
        async let username = fetchUsername(from: server)
        let greeting = await "Hello \(username), user ID \(userID)"
        print(greeting)
    }
    
    var body:some View{
       let hearts=Suits.hearts
       let suitsDescs=simpleDesc()
        VStack{
       Text(""+suitsDescs)
        }
    }
    

        
}
