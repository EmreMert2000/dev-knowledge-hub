//
//  AccessControl.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Access Control Playground
import SwiftUI

// Example 1 — private
class BankAccount {
    private var balance = 0
    func deposit(_ amount: Int) {
        balance += amount
    }
    func getBalance() -> Int {
        return balance
    }
}

// Example 2 — fileprivate
fileprivate struct InternalLogger {
    static func log(_ message: String) {
        print("[Internal]", message)
    }
}

// Example 3 — public
public struct APIClient {
    public init() { }
    public func request() {
        print("Performing public API request...")
    }
}

// Example 4 — open
open class OpenBaseClass {
    open func run() {
        print("OpenBaseClass running...")
    }
}

open class OpenChildClass: OpenBaseClass {
    override open func run() {
        print("OpenChildClass override running...")
    }
}

// Example 5 — private(set)
struct LikeCounter {
    private(set) var likes = 0
    mutating func addLike() {
        likes += 1
    }
}

// Example 6 — Nested Types
public struct UserProfile {
    public struct PublicInfo {
        public let username: String
    }
    private struct PrivateInfo {
        let ssn: String
    }
    public init(username: String) {
        self.publicInfo = PublicInfo(username: username)
        self.privateInfo = PrivateInfo(ssn: "123-45-6789")
    }
    public let publicInfo: PublicInfo
    private let privateInfo: PrivateInfo
}

// MARK: - Runner
struct AccessControlRunner {
    static func run() {
        print("--- Access Control Playground ---")

        // private example
        let account = BankAccount()
        account.deposit(100)
        print("Bank balance:", account.getBalance())

        // fileprivate example
        InternalLogger.log("Fileprivate logger working")

        // public example
        let client = APIClient()
        client.request()

        // open class example
        let openChild = OpenChildClass()
        openChild.run()

        // private(set) example
        var counter = LikeCounter()
        counter.addLike()
        print("Likes:", counter.likes)

        // nested types example
        let profile = UserProfile(username: "Emre")
        print("Public username:", profile.publicInfo.username)
    }
}

// MARK: - SwiftUI Preview
struct AccessControlView: View {
    var body: some View {
        Text("Access Control Running...")
            .onAppear {
                AccessControlRunner.run()
            }
    }
}
