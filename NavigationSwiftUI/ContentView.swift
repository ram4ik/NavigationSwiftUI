//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by admin on 11/14/23.
//

import SwiftUI

struct DetailsView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailsView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailsView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
