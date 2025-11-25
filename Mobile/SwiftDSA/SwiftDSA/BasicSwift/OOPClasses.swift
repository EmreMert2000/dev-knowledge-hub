//
//  OOPClasses.swift
//  SwiftDSA
//
//  Created by Emre Mert on 22.11.2025.
//
import SwiftUI
//Start 26.11.2025




// MARK: - Organized OOP Example Structure
struct OOPExamples {
    
    struct Resolution{
        var width=0
        var height=0
    }
    //class yapısı oluşturulkacak videomodel
    static func run() {
        // --- Struct Example: Resolution ---
        var res1 = Resolution(width: 1920, height: 1080)
        var res2 = res1  // value copy
        res2.width = 1280
        print("Struct Copy - res1.width:", res1.width, "res2.width:", res2.width)

        // --- Class Example: VideoMode ---
        let video1 = VideoMode()
        video1.name = "Original Mode"

        let video2 = video1   // reference copy
        video2.name = "Edited Mode"
        print("Class Reference - video1.name:", video1.name ?? "", "video2.name:", video2.name ?? "")

        // --- Enum Example with Mutating Method ---
        var direction = CompassPoint.east
        print("Initial direction:", direction)

        direction.turnNorth()
        print("Direction after turning north:", direction)
    }
}


struct OOPDemoView: View {
    var body: some View {
        Text("OOP Examples Running...")
            .onAppear {
                OOPExamples.run()
            }
    }
}
