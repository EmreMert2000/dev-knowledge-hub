//
//  Methods.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

import SwiftUI


// MARK: - Methods Playground
struct MethodsPlayground {

    // Instance Method Example
    struct Counter {
        var value = 0
        func display() {
            print("Current value:", value)
        }
    }

    // Mutating Method Example
    struct MutatingCounter {
        var value = 0
        mutating func increment() {
            value += 1
        }
    }

    // Type Method Example
    struct MathTools {
        static func square(_ x: Int) -> Int {
            x * x
        }
    }

    // Enum Method Example
    enum Direction {
        case north, south, east, west
        mutating func turnNorth() {
            self = .north
        }
    }

    // Method Overloading Example
    struct Printer {
        func printValue(_ value: Int) { print("Int:", value) }
        func printValue(_ value: String) { print("String:", value) }
        func printValue(_ value: Double) { print("Double:", value) }
    }

    // Methods Returning Self Example
    struct Vector {
        var x: Int
        var y: Int
        func add(_ v: Vector) -> Vector {
            Vector(x: x + v.x, y: y + v.y)
        }
    }

    // Extension with Method Example
}

extension Int {
    func squared() -> Int {
        self * self
    }
}

// MARK: - Run Examples
struct MethodsRunner {
    static func run() {

        // Instance Method
        let c = MethodsPlayground.Counter(value: 10)
        c.display()

        // Mutating Method
        var mc = MethodsPlayground.MutatingCounter(value: 1)
        mc.increment()
        print("Mutating:", mc.value)

        // Type Method
        print("Square:", MethodsPlayground.MathTools.square(6))

        // Enum Method
        var dir = MethodsPlayground.Direction.west
        dir.turnNorth()
        print("Direction:", dir)

        // Method Overloading
        let printer = MethodsPlayground.Printer()
        printer.printValue(5)
        printer.printValue("Hello")
        printer.printValue(3.14)

        // Returning Self
        let v1 = MethodsPlayground.Vector(x: 2, y: 3)
        let v2 = MethodsPlayground.Vector(x: 1, y: 1)
        let resultVector = v1.add(v2)
        print("Vector result:", resultVector.x, resultVector.y)

        // Extension Method
        print("5 squared =", 5.squared())
    }
}

// Call the runner
struct MethodsView:View {
    var body: some View {
        Text("Methods Running...")
            .onAppear {
                MethodsRunner.run()
            }
    }
}
