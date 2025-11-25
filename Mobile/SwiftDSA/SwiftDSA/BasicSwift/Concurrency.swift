//
//  Concurrency.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Concurrency Playground
import Foundation

// Async function example
func fetchUser() async -> String {
    try? await Task.sleep(nanoseconds: 300_000_000)
    return "Emre Mert"
}

func fetchPosts() async -> [String] {
    try? await Task.sleep(nanoseconds: 500_000_000)
    return ["Post 1", "Post 2", "Post 3"]
}

// Async let example (parallel tasks)
func fetchUserAndPosts() async -> (String, [String]) {
    async let user = fetchUser()
    async let posts = fetchPosts()
    return await (user, posts)
}

// Actor example (thread-safe)
actor BankAccount {
    var balance: Int = 0
    func deposit(_ amount: Int) {
        balance += amount
    }
}

// Detached task example
func detachedExample() {
    Task.detached {
        print("Detached task running on thread:", Thread.current)
    }
}

// Cancellation example
func cancellableTask() async {
    for i in 1...5 {
        if Task.isCancelled {
            print("Task cancelled at step \(i)")
            return
        }
        print("Working step", i)
        try? await Task.sleep(nanoseconds: 200_000_000)
    }
}

// MARK: - Runner
struct ConcurrencyRunner {
    static func run() {
        print("--- Concurrency Playground ---")

        Task {
            let (user, posts) = await fetchUserAndPosts()
            print("User:", user)
            print("Posts:", posts)

            let account = BankAccount()
            await account.deposit(100)
            print("Account deposited.")

            detachedExample()

            let task = Task {
                await cancellableTask()
            }
            task.cancel()
        }
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
struct ConcurrencyView: View {
    var body: some View {
        Text("Concurrency Running...")
            .onAppear {
                ConcurrencyRunner.run()
            }
    }
}
