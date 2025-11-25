//
//  Attirubitues.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//



// MARK: - Statements & Attributes Playground
import SwiftUI

// MARK: - Statements Examples

// Expression Statement
func expressionExample() {
    print("Expression executed")
}

// Declaration Statement
struct Player {
    let name: String
}

// Loop Statement
func loopExample() {
    for i in 1...3 {
        print("Loop:", i)
    }
}

// Branching Statement
func branchingExample(score: Int) {
    if score > 60 {
        print("Pass")
    } else {
        print("Fail")
    }
}

// Control Transfer Statement
func controlTransferExample() {
    for i in 1...5 {
        if i == 3 { continue }
        print("Number:", i)
    }
}

// Defer Statement
func deferExample() {
    print("Opening file...")
    defer { print("Closing file...") }
    print("Reading file...")
}

// Do Statement
func doBlockExample() {
    do {
        print("Inside do block")
    }
}

// MARK: - Attributes Examples

// @available
@available(iOS 15, *)
func newiOS15Feature() {
    print("Running an iOS 15+ feature")
}

// @discardableResult
@discardableResult
func computeValue() -> Int {
    return 42
}

// @MainActor
@MainActor
func updateUI() {
    print("UI updated on main actor")
}

// @escaping
func loadData(completion: @escaping () -> Void) {
    DispatchQueue.global().async {
        completion()
    }
}

// @dynamicMemberLookup
@dynamicMemberLookup
struct JSONWrapper {
    subscript(dynamicMember member: String) -> String {
        return "Value for \(member)"
    }
}

// MARK: - Runner
struct AttributesRunner {
    static func run() {
        print("--- Statements & Attributes Playground ---")

        expressionExample()
        loopExample()
        branchingExample(score: 75)
        controlTransferExample()
        deferExample()
        doBlockExample()

        _ = computeValue()

        let json = JSONWrapper()
        print(json.username)

        Task { @MainActor in
            updateUI()
        }

        loadData {
            print("Data loaded with escaping closure")
        }
    }
}

// MARK: - SwiftUI Preview
struct AttributesView: View {
    var body: some View {
        Text("Attributes Running...")
            .onAppear {
                AttributesRunner.run()
            }
    }
}

