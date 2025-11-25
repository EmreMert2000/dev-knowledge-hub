//
//  Macros.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//



// MARK: - Macros Playground
import Foundation
import SwiftUI

// Built-in freestanding macros
#warning("Macros Playground Loaded")
let generatedUUID = #UUID()

// Example freestanding macro simulation (compile-time value)
let buildTime = #fileID

// Attached macro demo placeholder (conceptual; real macro requires macro package)
@available(*, message: "Demo only – real macro requires plugin package")
@propertyWrapper
struct Uppercased {
    private var value: String = ""
    var wrappedValue: String {
        get { value.uppercased() }
        set { value = newValue }
    }
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
}

struct DemoUser {
    @Uppercased var name: String = "emre mert"
}

// Freestanding Debug Macro Style Function (simulated)
func logDebug(_ message: String, file: String = #fileID, line: Int = #line) {
    print("[DEBUG] \(file):\(line) → \(message)")
}

// MARK: - Runner
struct MacrosRunner {
    static func run() {
        print("--- Macros Playground ---")

        print("Generated UUID:", generatedUUID)
        print("Build Source:", buildTime)

        let user = DemoUser()
        print("Uppercased User Name:", user.name)

        logDebug("Testing debug logger macro simulation")
    }
}

// MARK: - SwiftUI Preview
struct MacrosView: View {
    var body: some View {
        Text("Macros Running...")
            .onAppear {
                MacrosRunner.run()
            }
    }
}
