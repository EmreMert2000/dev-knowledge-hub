//
//  AutoReferenceCounting.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//


// MARK: - Automatic Reference Counting (ARC) Playground
import SwiftUI

// Example 1 — Strong Reference Cycle
class Teacher {
    var student: Student?
    deinit { print("Teacher deallocated") }
}

class Student {
    var teacher: Teacher?
    deinit { print("Student deallocated") }
}

// Example 2 — Weak Reference (cycle solved)
class Owner {
    weak var pet: Pet?
    deinit { print("Owner deallocated") }
}

class Pet {
    var owner: Owner?
    deinit { print("Pet deallocated") }
}

// Example 3 — Unowned Reference
class CreditCard {
    unowned let user: User
    init(user: User) {
        self.user = user
    }
    deinit { print("CreditCard deallocated") }
}

class User {
    var card: CreditCard?
    deinit { print("User deallocated") }
}

// Example 4 — Closure Capture List
class Profile {
    var name = "Emre"
    lazy var printName: () -> Void = { [weak self] in
        print(self?.name ?? "nil")
    }
    deinit { print("Profile deallocated") }
}

// MARK: - Runner
struct ARCRunner {
    static func run() {
        print("--- ARC Playground ---")

        // Strong Reference Cycle (leak)
        print("Testing strong cycle...")
        do {
            let teacher = Teacher()
            let student = Student()
            teacher.student = student
            student.teacher = teacher
            // No deinit → memory leak
        }

        // Weak Reference Fix
        print("Testing weak reference...")
        do {
            let owner = Owner()
            let pet = Pet()
            owner.pet = pet
            pet.owner = owner
            // Both deallocated
        }

        // Unowned Reference
        print("Testing unowned reference...")
        do {
            let user = User()
            let card = CreditCard(user: user)
            user.card = card
            // Both deallocated together
        }

        // Closure capture list
        print("Testing closure capture...")
        do {
            let profile = Profile()
            profile.printName()
        }
    }
}

// MARK: - SwiftUI Preview
struct ARCView: View {
    var body: some View {
        Text("ARC Running...")
            .onAppear {
                ARCRunner.run()
            }
    }
}
