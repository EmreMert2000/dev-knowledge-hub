//
//  OptionalChaining.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//



// MARK: - Optional Chaining Playground

class Residence {
    var rooms: Int
    init(rooms: Int) {
        self.rooms = rooms
    }
    func printRooms() {
        print("Rooms:", rooms)
    }
}

class Person {
    var residence: Residence?
}

class Dog {
    func bark() {
        print("Woof!")
    }
}

struct OptionalChainingRunner {
    static func run() {
        print("--- Optional Chaining Playground ---")

        // Property chaining
        let person = Person()
        print(person.residence?.rooms as Any)   // nil

        // Assigning using optional chaining (won't work because nil)
        person.residence?.rooms = 5

        // Setting the residence
        person.residence = Residence(rooms: 3)
        print(person.residence?.rooms as Any)

        // Method chaining
        person.residence?.printRooms()

        // Optional-chained method on optional object
        var dog: Dog? = Dog()
        dog?.bark()

        dog = nil
        dog?.bark()   // won't execute

        // Optional chaining with dictionaries
        let dict: [String: [Int]]? = ["scores": [10,20,30]]
        print(dict?["scores"]?[1] as Any)

        // Multi-level chaining
        let multi = Person()
        multi.residence = Residence(rooms: 10)
        print(multi.residence?.rooms.description.uppercased() as Any)
    }
}

import SwiftUI
struct OptionalChainingView: View {
    var body: some View {
        Text("Optional Chaining Running...")
            .onAppear {
                OptionalChainingRunner.run()
            }
    }
}
