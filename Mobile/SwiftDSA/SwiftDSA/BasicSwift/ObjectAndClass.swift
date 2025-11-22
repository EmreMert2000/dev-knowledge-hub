import SwiftUI

class Shape {
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class namedShape{
    var numberOfSides:Int=0
    var name:String
    
    init( name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
           return "A shape with \(numberOfSides) sides."
        }
}

class Square:namedShape{
var sideLength: Double


    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area()-> Double{
        return sideLength*sideLength
    }
    override func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
     }
    
}
struct objectView: View {
    let shape = Shape()   // class instance
    let description = Square(sideLength: 5.2, name: "my test square")
   
    var body: some View {
        VStack {
           // Text(shape.simpleDescription())
          //  Text(""+description.area())
           // Text(""+description.simpleDescription())
        }
    }
}

#Preview {
    objectView()
}

