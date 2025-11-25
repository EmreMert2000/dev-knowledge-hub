//
//  ErrorControlInProgram.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Error Handling Playground

// Custom Error Types
enum FileError: Error {
    case notFound
    case noPermission
    case corrupted
}

// Throwing Function Example
func readFile(name: String) throws -> String {
    if name.isEmpty { throw FileError.notFound }
    if name == "restricted" { throw FileError.noPermission }
    if name == "broken" { throw FileError.corrupted }
    return "File: \(name) loaded successfully"
}

// Math Error Example
enum MathError: Error {
    case divideByZero
}

func divide(_ a: Int, by b: Int) throws -> Int {
    if b == 0 { throw MathError.divideByZero }
    return a / b
}

// Rethrows Example
func performSafely(_ operation: () throws -> Void) rethrows {
    try operation()
}

// Defer Example
func openConnection() {
    print("Connection opened")
    defer { print("Connection closed") }
    print("Processing...")
}

// MARK: - Runner
struct ErrorHandlingRunner {
    static func run() {
        print("--- Error Handling Playground ---")

        // do-catch example
        do {
            let file = try readFile(name: "data.txt")
            print(file)
        } catch FileError.notFound {
            print("Error: File not found")
        } catch FileError.noPermission {
            print("Error: No permission")
        } catch FileError.corrupted {
            print("Error: File is corrupted")
        } catch {
            print("Unknown error:", error)
        }

        // try? example
        let safeFile = try? readFile(name: "")
        print("try? result:", safeFile as Any)

        // try! example (unsafe)
        // let forced = try! readFile(name: "data.txt")

        // math error
        do {
            let result = try divide(10, by: 0)
            print(result)
        } catch {
            print("Math error:", error)
        }

        // rethrows example
        do {
            try performSafely {
                let _ = try readFile(name: "restricted")
            }
        } catch {
            print("Caught in rethrows:", error)
        }

        // defer example
        openConnection()
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
struct ErrorHandlingView: View {
    var body: some View {
        Text("Error Handling Running...")
            .onAppear {
                ErrorHandlingRunner.run()
            }
    }
}
