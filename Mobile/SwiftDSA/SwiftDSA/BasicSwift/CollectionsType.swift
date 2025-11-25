//
//  CollectionsType.swift
//  SwiftDSA
//
//  Created by Emre Mert on 24.11.2025.
//

import SwiftUI

struct CollectionsType: View {
    var body: some View {
        VStack {
        }
        .onAppear {
            CollectionsFunctions.run()
        }
    }
}

#Preview {
    CollectionsType()
}




class CollectionsFunctions {

    static func run() {

        var someNumbers:[String] = ["muzaffer","leyla","selami"]

        //For each item in the array, the enumerated() method returns a tuple composed of an integer and the item.
        for (index,value) in someNumbers.enumerated(){
            print("Item \(index + 1): \(value)")
        }

        //Set with an array literal
        var favoriteGames:Set<String>=["Fm","Fifa","NSS"]

        if favoriteGames.isEmpty{
            print("As far as game goes, I'm not picky.")
        } else {
            print("I have particular game preferences.")
        }

        favoriteGames.insert("FutFM")

        //Insert Method
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

        print(oddDigits.union(evenDigits).sorted())
        print(oddDigits.intersection(evenDigits).sorted())
        print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
        print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

        //Dictonires
        var car:[String:String]=["Toyota":"Toyata"]

        print(car.count)

        var numbers=[0,2,4,5,7,8]

        if numbers.contains(2){
            print("thanks")
        }
        else{
            numbers.append(2)
            print(numbers.last ?? 0)
        }

        let minuteInternal:Int=15
        let hourInterval = 3
        //Use the stride(from:to:by:) function to skip the unwanted marks.
        //for i in stride(from: 0, to: hourInterval, by: minuteInternal)


        //Tuples
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        for character in puzzleInput {
            if charactersToRemove.contains(character) {
                continue
            }
            puzzleOutput.append(character)
        }
        print(puzzleOutput)

        //Functions
        print(PersonInfo(person:"emre", number: 4))


        // Min Max bulma
        let bounds=minmaxfind(array: [0,4,2,4,5,6,7])

        print("Min \(bounds.min) Max: \(bounds.max)")

        print(greeting(for: "selami"))
    }
}

class CollectionsClosures{
    
    static func run(){
        
        // Basit closure örneği — bir ismi alır ve selam verir
        let greet = { (name: String) in
            print("Hello \(name)")
        }
        greet("Emre")

        // Trailing closure örneği — indirilen veriyi closure ile döndürür
        func download(text: String, completion: (String) -> Void) {
            completion("Downloaded: \(text)")
        }
        download(text: "Swift") { output in
            print(output)
        }

        // map / filter / reduce örnekleri — fonksiyonel dönüşümler
        let numbers = [1,2,3,4,5]
        let doubled = numbers.map { $0 * 2 }
        print(doubled)

        let evens = numbers.filter { $0 % 2 == 0 }
        print(evens)

        let total = numbers.reduce(0, +)
        print(total)

        // Escaping closure örneği — async işlemden sonra çağrılır
        func fetchData(completion: @escaping (String) -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion("Data returned")
            }
        }
        fetchData { text in
            print(text)
        }

        // Capturing values örneği — closure dış değişken değerini saklar
        func makeCounter() -> () -> Int {
            var count = 0
            return {
                count += 1
                return count
            }
        }
        let counter = makeCounter()
        print(counter())
        print(counter())
        print(counter())

        // --- Advanced Closure Examples ---

        // Autoclosure — expression automatically converted to closure
        func logAuto(_ message: @autoclosure () -> String) {
            print("LOG:", message())
        }
        logAuto("User logged in successfully")

        // Multiple trailing closures — success and failure blocks
        func fetchUser(
            success: (String) -> Void,
            failure: (Error) -> Void
        ) {
            let isSuccess = true
            if isSuccess {
                success("emremert")
            } else {
                failure(NSError(domain: "UserError", code: -1))
            }
        }

        fetchUser { username in
            print("User:", username)
        } failure: { error in
            print("Error:", error.localizedDescription)
        }

        // Capture list — avoid retain cycle
        class DemoClass {
            var value = 10
            func start() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.value += 1
                    print("Value:", self?.value ?? 0)
                }
            }
        }
        let demo = DemoClass()
        demo.start()

        // Async/Await + closure bridging
        func loadData() async -> String {
            await withCheckedContinuation { continuation in
                DispatchQueue.global().async {
                    continuation.resume(returning: "Loaded with continuation")
                }
            }
        }
        Task {
            let result = await loadData()
            print(result)
        }

        // Higher-order function — returns a closure
        func makeMultiplier(_ x: Int) -> (Int) -> Int {
            return { value in value * x }
        }
        let times3 = makeMultiplier(3)
        print(times3(5))

        // State machine using closure capturing
        func makeStateMachine() -> (String) -> String {
            var state = "idle"
            return { input in
                if input == "start" { state = "running" }
                else if input == "stop" { state = "stopped" }
                return state
            }
        }
        let machine = makeStateMachine()
        print(machine("start"))
        print(machine("stop"))

        // Operator as closure
        let sumOp: (Int, Int) -> Int = (+)
        print(sumOp(10, 20))

        // Generic closure example
        func transform<T>(_ value: T, using closure: (T) -> T) -> T {
            return closure(value)
        }
        let resultGeneric = transform(5) { $0 * 2 }
        print(resultGeneric)

    }
    
    
}




// Düzeltilmiş versiyon
func PersonInfo(person:String, number:Int) -> String {

    var result = person

    if(number % 2 == 0){
        // even → person
        let _ = result
    }
    else {
        result = "Not Person"
    }

    return result
}

// Min Max bulma
func minmaxfind(array:[Int])->(min:Int,max:Int){
    var currentMin=array[0]
    var currentMax=array[0]

    for value in array[1..<array.count]{
        if value<currentMin{
           currentMin=value
        }
        else if value>currentMax{
           currentMax=value
        }
    }
    return(currentMin,currentMax)
}

func greeting(for Person:String)->String{
    return "Hello"+Person
}
