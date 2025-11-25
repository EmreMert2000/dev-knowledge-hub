//
//  Patterns.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//





// MARK: - Pattern Matching Playground
import SwiftUI

// Example 1 — Enum Case Pattern
enum Device {
    case iPhone(model: String)
    case iPad
    case mac(model: String, year: Int)
}

func enumPatternExample() {
    let device: Device = .iPhone(model: "15 Pro")

    switch device {
    case .iPhone(let model):
        print("iPhone model:", model)
    case .iPad:
        print("iPad detected")
    case .mac(let model, let year):
        print("Mac:", model, "Year:", year)
    }
}

// Example 2 — Tuple Pattern
func tuplePatternExample() {
    let point = (x: 0, y: 5)

    switch point {
    case (0, 0):
        print("Origin Point")
    case (let x, 0):
        print("On X-axis at", x)
    case (0, let y):
        print("On Y-axis at", y)
    case let (x, y):
        print("Point at (\(x), \(y))")
    }
}

// Example 3 — Value Binding Pattern
func valueBindingPatternExample() {
    let age = 32

    switch age {
    case let x where x < 18:
        print("Minor:", x)
    case let x where x >= 18 && x < 30:
        print("Young adult:", x)
    case let x:
        print("Adult:", x)
    }
}

// Example 4 — Wildcard Pattern
func wildcardPatternExample() {
    let items = ["Emre", "Mert", "Swift"]

    for _ in items {
        print("Loop item ignored, only repeating.")
    }
}

// Example 5 — Optional Pattern
func optionalPatternExample() {
    let value: Int? = 10

    switch value {
    case .some(let number):
        print("Number:", number)
    case .none:
        print("No value")
    }
}

// Example 6 — Pattern Matching in if / guard
func guardPatternExample(device: Device) {
    if case .mac(let model, _) = device {
        print("Matched a Mac model:", model)
    }
}

// MARK: - Runner
struct PatternsRunner {
    static func run() {
        print("--- Patterns Playground ---")
        enumPatternExample()
        tuplePatternExample()
        valueBindingPatternExample()
        wildcardPatternExample()
        optionalPatternExample()
        guardPatternExample(device: .mac(model: "MacBook Pro", year: 2023))
    }
}

// MARK: - SwiftUI Preview
struct PatternsView: View {
    var body: some View {
        Text("Patterns Running...")
            .onAppear {
                PatternsRunner.run()
            }
    }
}
