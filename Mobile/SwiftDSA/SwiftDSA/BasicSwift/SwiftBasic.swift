import SwiftUI

struct content: View {
  //  var mydata = 4
   // var mycarry = "selam"

    let myarray: [Int] = [5, 12, 15, 25, 30]
    let individualScores = [75, 43, 103, 87, 12]
    var score=0
    var body: some View {
        VStack {
            Text("App çalıştı")
            Test(''+returnFifteen())
           // Text(greet("John", on: "Çarşamba"))
                .onAppear {
                    //writefun()
                   // writearray()
                  
                    
                    
                }
        }
    }

    func writefun() {
      //  print(mydata)
       
    }
    
    func writearray(){
        //  print(myarray)
        
      /*  for score in individualScores {
            
            if score > 50 {
                    score += 3
                } else {
                    score += 1
                }
        } */
        
      }
    func greet(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    func calculateScore(scores: [Int]) -> (min: Int, max: Int, sum: Int)
    {
            var min = scores[0]
            var max = scores[0]
            var sum = 0
        
        for score in scores {
               if score > max {
                   max = score
               } else if score < min {
                   min = score
               }
               sum += score
           }
        return(min,max,sum)
    }
    
    func returnFifteen()->Int{
        var y=10
        func add(){
            y+=5
            
        }
        add()
        return y
        }
        
    }
    
}

#Preview {
    content(score: 0)
}
