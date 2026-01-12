//
//  CircleClass.swift
//  SwiftDSA
//
//  Created by Emre Mert on 8.01.2026.
//


import Foundation

// =======================================================
// MARK: - 1️⃣ PROTOCOL (Interface mantığı)
//
// SOLID → DIP (Dependency Inversion Principle)
// Üst seviye modüller somut sınıflara değil,
// abstraction (protocol)lara bağımlı olmalı
// =======================================================

protocol Payable {
    func calculateSalary() -> Double
}

// =======================================================
// MARK: - 2️⃣ BASE CLASS
//
// OOP → Class + Encapsulation
// Ortak özellik ve davranışlar burada tanımlanır
// =======================================================

class Person {
    
    // Encapsulation → dışarıdan değiştirilemez
    let name: String
    let age: Int
    
    // Constructor
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Polymorphism için override edilebilir
    func getInfo() -> String {
        return "\(name) (\(age))"
    }
}

// =======================================================
// MARK: - 3️⃣ PLAYER CLASS
//
// OOP → Inheritance + Polymorphism
// SOLID → SRP (Single Responsibility)
// Bu sınıf sadece oyuncu davranışından sorumlu
// =======================================================

class Player: Person, Payable {
    
    // Encapsulation → dışarıdan erişim kapalı
    private var goals: Int = 0
    private let baseSalary: Double
    
    init(name: String, age: Int, baseSalary: Double) {
        self.baseSalary = baseSalary
        super.init(name: name, age: age)
    }
    
    // Oyuncuya özel davranış
    func scoreGoal() {
        goals += 1
    }
    
    // Protocol implementasyonu
    // Polymorphism → farklı class, farklı hesaplama
    func calculateSalary() -> Double {
        return baseSalary + Double(goals * 1000)
    }
    
    // Override → base class davranışını değiştirme
    override func getInfo() -> String {
        return super.getInfo() + " | Goller: \(goals)"
    }
}

// =======================================================
// MARK: - 4️⃣ COACH CLASS
//
// OOP → Inheritance
// Aynı protocol, farklı davranış (Polymorphism)
// =======================================================

class Coach: Person, Payable {
    
    private let experienceYear: Int
    
    init(name: String, age: Int, experienceYear: Int) {
        self.experienceYear = experienceYear
        super.init(name: name, age: age)
    }
    
    func calculateSalary() -> Double {
        return Double(experienceYear * 5000)
    }
}

// =======================================================
// MARK: - 5️⃣ COMPOSITION
//
// Club, Player veya Coach'u tanımaz
// Sadece Payable bilir
//
// SOLID → OCP (Open/Closed Principle)
// Yeni rol eklendiğinde Club değişmez
// =======================================================

class Club {
    
    let name: String
    
    // Dependency Inversion → protocol kullanımı
    private var staff: [Payable] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addStaff(_ person: Payable) {
        staff.append(person)
    }
    
    func totalSalaryCost() -> Double {
        staff.reduce(0) { $0 + $1.calculateSalary() }
    }
}

// =======================================================
// MARK: - 6️⃣ USAGE (Main)
//
// Polymorphism + Loose Coupling örneği
// =======================================================

let player = Player(name: "Emre", age: 25, baseSalary: 10_000)
player.scoreGoal()
player.scoreGoal()

let coach = Coach(name: "Ahmet", age: 50, experienceYear: 10)

let club = Club(name: "FutVeri FC")

// Club hangi sınıf olduğunu umursamaz
club.addStaff(player)
club.addStaff(coach)

print(player.getInfo())
print("Toplam maaş gideri:", club.totalSalaryCost())

// =======================================================
// MARK: - 7️⃣ INTERVIEW ÖZETİ
//
// • Class        → Person, Player, Coach
// • Encapsulation → private değişkenler
// • Inheritance  → Player : Person
// • Polymorphism → calculateSalary()
// • Protocol     → Payable
// • Composition  → Club → Payable
// • SOLID        → SRP, OCP, DIP
// =======================================================



