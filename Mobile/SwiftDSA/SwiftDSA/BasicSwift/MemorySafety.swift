//
//  MemorySafety.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Memory Safety Playground
import SwiftUI

// Example 1 — Exclusive Access to Memory (inout conflict)
func increment(_ number: inout Int) {
    number += 1
}

// Example 2 — Value Type Copy Safety (struct copy behavior)
struct PlayerStats {
    var score: Int
}

// Example 3 — Mutating rule demonstration
struct Counter {
    var value = 0
    mutating func add() {
        value += 1
    }
}

// Example 4 — Actor (data race safe)
actor BankAccount {
    var balance = 0
    func deposit(_ amount: Int) {
        balance += amount
    }
}

// MARK: - Runner
struct MemorySafetyRunner {
    static func run() {
        print("--- Memory Safety Playground ---")

        // Exclusive Access (cannot demonstrate without compile error, so conceptual)
        var step = 1
        increment(&step)
        print("Increment result:", step)

        // Value Type Copy Safety
        var s1 = PlayerStats(score: 10)
        var s2 = s1 // copy
        s2.score = 20
        print("Original score:", s1.score, "Copied score:", s2.score)

        // Mutating example
        var counter = Counter()
        counter.add()
        print("Counter value:", counter.value)

        // Actor Safe Data Access
        Task {
            let account = BankAccount()
            await account.deposit(100)
            print("Actor deposit executed safely")
        }
    }
}

// MARK: - SwiftUI Preview
struct MemorySafetyView: View {
    var body: some View {
        Text("Memory Safety Running...")
            .onAppear {
                MemorySafetyRunner.run()
            }
    }
}
