//
//  Intheritance.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Inheritance Playground
class Animal {
    var name: String
    init(name: String) { self.name = name }
    func makeSound() { print("Animal sound") }
    deinit { print("Animal deinit") }
}

class Dog: Animal {
    override func makeSound() {
        super.makeSound()
        print("Woof!")
    }
}

class Cat: Animal {
    override func makeSound() { print("Meow!") }
}

// Property overriding example
class Car {
    var speed: Int = 0
}

class Tesla: Car {
    override var speed: Int {
        didSet { print("Tesla speed changed:", speed) }
    }
}

// Shape inheritance
class Shape {
    var area: Double { 0 }
}

class Circle: Shape {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
        super.init()
    }
    override var area: Double {
        Double.pi * radius * radius
    }
}

// Required initializer example
class Base {
    required init() { }
}

class Child: Base {
    required init() { }
}

// MARK: - Runner
struct InheritanceRunner {
    static func run() {
        let dog = Dog(name: "Karabaş")
        dog.makeSound()

        let cat = Cat(name: "Zuzu")
        cat.makeSound()

        let tesla = Tesla()
        tesla.speed = 120

        let circle = Circle(radius: 5)
        print("Circle area:", circle.area)

        let animals: [Animal] = [dog, cat, Animal(name: "Generic")]
        animals.forEach { $0.makeSound() }

        _ = Child()  // required init test
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
struct InheritanceView: View {
    var body: some View {
        Text("Inheritance Running...")
            .onAppear {
                InheritanceRunner.run()
            }
    }
}
#Preview {
    InheritanceView()
}
