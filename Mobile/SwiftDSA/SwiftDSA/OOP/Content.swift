//
//  ContentView.swift
//  SwiftDSA
//
//  Created by Emre Mert on 12.01.2026.
//

import SwiftUI

struct Content: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // MARK: - Modifier kullanımı
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                
                Text("Hello, world!")
                    .fontWeight(.bold)
                    .modifier(TitleModifier(color: .blue))
            }
            
            // MARK: - Extension ile custom modifier
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
                
                Text("Hello, world!")
                    .makeTitle(color: .red)
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

// =======================================================
// MARK: - ViewModifier
// =======================================================

struct TitleModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(color)
    }
}

// =======================================================
// MARK: - View Extension
// =======================================================

extension View {
    func makeTitle(color: Color) -> some View {
        self.modifier(TitleModifier(color: color))
    }
}

