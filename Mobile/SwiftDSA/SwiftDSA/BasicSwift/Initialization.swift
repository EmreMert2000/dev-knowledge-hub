//
// MARK: - Initialization Playground
// Basic Struct Initialization
struct User {
    var name: String
    var age: Int
}

// Default Property Values
struct Player {
    var level: Int = 1
    var score: Int = 0
}

// Memberwise + Custom Init
struct Point {
    var x: Int
    var y: Int

    init(x: Int) {
        self.x = x
        self.y = 0
    }
}

// Initializer Delegation (Struct)
struct Rectangle {
    var width: Int
    var height: Int

    init(width: Int) {
        self.width = width
        self.height = 10
    }

    init(width: Int, height: Int) {
        self.init(width: width)
        self.height = height
    }
}

// Class Initialization (Designated + Convenience)
class Car {
    var model: String

    init(model: String) {
        self.model = model
    }

    convenience init() {
        self.init(model: "Unknown")
    }
}

// Failable Initializer
struct Temperature {
    var celsius: Double

    init?(fahrenheit: Double) {
        if fahrenheit < -459.67 { return nil }
        self.celsius = (fahrenheit - 32) * 5/9
    }
}

// Required Initializer Example
class Animal {
    required init() { }
}

class Dog: Animal {
    required init() { }
}

// Enum Initialization
enum Direction {
    case north, south, east

    init?(symbol: String) {
        switch symbol {
        case "N": self = .north
        case "S": self = .south
        default: return nil
        }
    }
}

// Deinitialization Example
class FileReader {
    init() { print("FileReader opened") }
    deinit { print("FileReader closed") }
}

// MARK: - Runner
struct InitializationRunner {
    static func run() {
        print("--- Initialization Playground ---")

        // User
        let u = User(name: "Emre", age: 25)
        print("User:", u.name, u.age)

        // Player
        let p = Player()
        print("Player:", p.level, p.score)

        // Point
        let pt = Point(x: 5)
        print("Point:", pt.x, pt.y)

        // Rectangle
        let rect = Rectangle(width: 10, height: 20)
        print("Rectangle:", rect.width, rect.height)

        // Car
        let car1 = Car(model: "BMW")
        let car2 = Car()
        print("Cars:", car1.model, car2.model)

        // Temperature
        if let t = Temperature(fahrenheit: 100) {
            print("Temp:", t.celsius)
        } else {
            print("Invalid temp")
        }

        // Direction
        if let d = Direction(symbol: "N") {
            print("Direction:", d)
        }

        // FileReader
        var reader: FileReader? = FileReader()
        reader = nil
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
struct InitializationView: View {
    var body: some View {
        Text("Initialization Running...")
            .onAppear {
                InitializationRunner.run()
            }
    }
}
// MARK: - Deinitialization Playground
class DeinitExample {
    var id: Int
    init(id: Int) {
        self.id = id
        print("DeinitExample \(id) initialized")
    }
    deinit {
        print("DeinitExample \(id) deinitialized")
    }
}

struct DeinitializationRunner {
    static func run() {
        print("--- Deinitialization Playground ---")
        var object: DeinitExample? = DeinitExample(id: 1)
        object = nil   // triggers deinit
    }
}

struct DeinitializationView: View {
    var body: some View {
        Text("Deinitialization Running...")
            .onAppear {
                DeinitializationRunner.run()
            }
    }
}
//  Initialization.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

