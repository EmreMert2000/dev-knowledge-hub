//
//  TypeCasting.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Type Casting Playground
import SwiftUI

// Base class
class Animal {
    func makeSound() {
        print("Animal sound")
    }
}

// Subclasses
class Dog: Animal {
    func bark() {
        print("Woof!")
    }
    override func makeSound() {
        print("Dog sound: Woof!")
    }
}

class Cat: Animal {
    func meow() {
        print("Meow!")
    }
    override func makeSound() {
        print("Cat sound: Meow!")
    }
}

// Protocol example
protocol Named {
    var name: String { get }
}

class User: Named {
    var name: String = "Emre"
}

// MARK: - Runner
struct TypeCastingRunner {
    static func run() {
        print("--- Type Casting Playground ---")

        // is operator
        let animal: Animal = Dog()
        if animal is Dog {
            print("animal is a Dog")
        }

        // as (upcasting)
        let dog = Dog()
        let upcastedAnimal: Animal = dog
        upcastedAnimal.makeSound()

        // as? (safe downcasting)
        if let castedDog = upcastedAnimal as? Dog {
            castedDog.bark()
        }

        // as! (force downcasting)
        let forcedDog = animal as! Dog
        forcedDog.bark()

        // Collection with mixed animals
        let zoo: [Animal] = [Dog(), Cat(), Dog(), Cat()]
        for creature in zoo {
            switch creature {
            case let d as Dog:
                d.bark()
            case let c as Cat:
                c.meow()
            default:
                creature.makeSound()
            }
        }

        // Any collection
        let mixed: [Any] = [1, "Hello", Dog(), 3.14]
        for item in mixed {
            switch item {
            case let number as Int:
                print("Integer:", number)
            case let text as String:
                print("String:", text)
            case let dog as Dog:
                dog.bark()
            default:
                print("Unknown type")
            }
        }

        // Protocol casting
        let named: Named = User()
        if let user = named as? User {
            print("Named protocol casted to User:", user.name)
        }
    }
}

// MARK: - SwiftUI Preview
struct TypeCastingView: View {
    var body: some View {
        Text("Type Casting Running...")
            .onAppear {
                TypeCastingRunner.run()
            }
    }
}
