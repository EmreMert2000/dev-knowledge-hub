//
//  Substricpt.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//


// MARK: - Subscripts Playground
struct SubscriptsPlayground {

    // Basic TimesTable subscript example
    struct TimesTable {
        let multiplier: Int
        subscript(n: Int) -> Int {
            multiplier * n
        }
    }

    // Matrix with multi-parameter subscript
    struct Matrix {
        var grid: [[Int]]
        subscript(row: Int, col: Int) -> Int {
            get { grid[row][col] }
            set { grid[row][col] = newValue }
        }
    }

    // Subscript overloading example
    struct Person {
        var attributes: [String: String] = [:]

        subscript(key: String) -> String? {
            get { attributes[key] }
            set { attributes[key] = newValue }
        }

        subscript(isLong: Bool) -> Int {
            isLong ? attributes.keys.count : attributes.count
        }
    }

    // Static subscript example
    struct Planet {
        static let names = ["Mercury", "Venus", "Earth", "Mars"]
        static subscript(index: Int) -> String {
            names[index]
        }
    }

    // Enum with subscript
    enum Level {
        case low, medium, high

        subscript(index: Int) -> String {
            switch index {
            case 0: return "low"
            case 1: return "medium"
            default: return "high"
            }
        }
    }

    // Subscript returning a closure
    struct CommandCenter {
        var commands: [String: () -> Void] = [:]

        subscript(command name: String) -> (() -> Void)? {
            get { commands[name] }
            set { commands[name] = newValue }
        }
    }
}

// MARK: - Runner
struct SubscriptRunner {
    static func run() {

        // TimesTable example
        let table = SubscriptsPlayground.TimesTable(multiplier: 5)
        print("5 x 3 =", table[3])

        // Matrix example
        var matrix = SubscriptsPlayground.Matrix(grid: [[1,2,3],[4,5,6]])
        print("Matrix[0,2] =", matrix[0,2])
        matrix[1,2] = 99
        print("Matrix updated[1,2] =", matrix[1,2])

        // Person subscript overload
        var person = SubscriptsPlayground.Person()
        person["name"] = "Emre"
        person["role"] = "Developer"
        print("Name =", person["name"] ?? "")
        print("Long? =", person[true])

        // Static subscript
        print("Planet 2 =", SubscriptsPlayground.Planet[2])

        // Enum subscript
        let level = SubscriptsPlayground.Level.low
        print("Level[1] =", level[1])

        // Command center subscript returning closure
        var center = SubscriptsPlayground.CommandCenter()
        center["start"] = { print("System Started") }
        center["start"]?()
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
struct SubscriptView: View {
    var body: some View {
        Text("Subscripts Running...")
            .onAppear {
                SubscriptRunner.run()
            }
    }
}
