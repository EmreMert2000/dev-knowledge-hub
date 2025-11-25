//
//  NestedTypes.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Nested Types Playground
import SwiftUI

// Example 1 — Struct containing Nested Struct
struct Player {
    struct Stats {
        var goals: Int
        var assists: Int
    }
    var name: String
    var stats: Stats
}

// Example 2 — Enum containing Nested Enums
enum ChessPiece {
    enum Color {
        case white, black
    }
    enum Kind {
        case pawn, rook, knight, bishop, queen, king
    }
    case piece(color: Color, kind: Kind)
}

// Example 3 — Class containing Nested Struct
class BankAccount {
    struct Transaction {
        var amount: Double
        var date: Date
    }
    var history: [Transaction] = []
    func add(amount: Double) {
        history.append(Transaction(amount: amount, date: Date()))
    }
}

// Example 4 — Namespacing via Nested Types
struct API {
    struct Endpoint {
        static let login = "/login"
        static let users = "/users"
    }
    enum Error: Swift.Error {
        case timeout
        case invalidData
    }
}

// MARK: - Runner
struct NestedTypesRunner {
    static func run() {
        print("--- Nested Types Playground ---")

        // Player example
        let p = Player(name: "Emre", stats: .init(goals: 10, assists: 5))
        print("Player:", p.name, "Goals:", p.stats.goals)

        // ChessPiece example
        let queen = ChessPiece.piece(color: .white, kind: .queen)
        print("ChessPiece:", queen)

        // BankAccount example
        let account = BankAccount()
        account.add(amount: 150)
        print("Bank history:", account.history)

        // API usage
        print("API Login Endpoint:", API.Endpoint.login)
        print("API Error Example:", API.Error.timeout)
    }
}

// MARK: - SwiftUI Preview
struct NestedTypesView: View {
    var body: some View {
        Text("Nested Types Running...")
            .onAppear {
                NestedTypesRunner.run()
            }
    }
}
