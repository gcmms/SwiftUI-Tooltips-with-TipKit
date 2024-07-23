//
//  ContentView.swift
//  TipKit
//
//  Created by Gabriel Sanzone on 22/07/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var colors = [
        Color.random,
        Color.random,
        Color.random,
        Color.random
    ]
    
    let addColorTip = AddColorTip()
    let setFavoriteTip = SetFavoriteTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TipView(setFavoriteTip)
                    .tipBackground(.teal.opacity(0.2))
                ForEach(colors, id: \.self) {
                    RoundedRectangle(cornerRadius: 10)
                    .fill($0.gradient)
                    .frame(height: 100)
                    .contextMenu {
                        Button("Favorite", systemImage: "star") {
                            print("oi")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar {
                Button {
                    colors.insert(.random, at: 0)
                    addColorTip.invalidate(reason: .actionPerformed)
                } label: {
                    Image(systemName: "plus")
                }
                .popoverTip(addColorTip)
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                //.displayFrequency(.immediate)
                .datastoreLocation(.applicationDefault)
            ])
        }
}
