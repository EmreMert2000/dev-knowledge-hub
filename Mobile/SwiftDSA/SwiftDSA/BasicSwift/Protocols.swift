//
//  Protocols.swift
//  SwiftDSA
//
//  Created by Emre Mert on 25.11.2025.
//

// MARK: - Protocols Playground
import SwiftUI

// Basic protocol
protocol Greetable {
    var name: String { get }
    func greet()
}

struct Person: Greetable {
    var name: String
    func greet() {
        print("Hello, \(name)")
    }
}

// Protocol inheritance
protocol Movable {
    func move()
}

protocol PlayerProtocol: Greetable, Movable { }

struct FootballPlayer: PlayerProtocol {
    var name: String
    func greet() { print("Player:", name) }
    func move() { print("\(name) is running") }
}

// Associated type example
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var items: [Item] { get }
}

struct IntContainer: Container {
    var items: [Int] = []
    mutating func add(_ item: Int) {
        items.append(item)
    }
}

// Protocol extension (default implementation)
extension Greetable {
    func greetPolitely() {
        print("Greetings, \(name)")
    }
}

// Protocol composition
func introduce(_ entity: Greetable & Movable) {
    entity.greet()
    entity.move()
}

// Class-only protocol example
protocol ButtonDelegate: AnyObject {
    func didPress()
}

class Button {
    weak var delegate: ButtonDelegate?
    func press() {
        delegate?.didPress()
    }
}

class GameController: ButtonDelegate {
    func didPress() {
        print("Button was pressed!")
    }
}

// MARK: - Runner
struct ProtocolsRunner {
    static func run() {
        print("--- Protocols Playground ---")

        let p = Person(name: "Emre")
        p.greet()
        p.greetPolitely()

        var ic = IntContainer()
        ic.add(10)
        ic.add(20)
        print("IntContainer items:", ic.items)

        let fp = FootballPlayer(name: "Mert")
        introduce(fp)

        let controller = GameController()
        let button = Button()
        button.delegate = controller
        button.press()
    }
}

// MARK: - SwiftUI Preview
struct ProtocolsView: View {
    var body: some View {
        Text("Protocols Running...")
            .onAppear {
                ProtocolsRunner.run()
            }
    }
}
