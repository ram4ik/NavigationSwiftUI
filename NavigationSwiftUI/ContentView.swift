//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by admin on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 42") {
                    path = [32]
                }
                Button("Show 7") {
                    path.append(7)
                }
                Button("Show 7 and 42") {
                    path = [7, 42]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
