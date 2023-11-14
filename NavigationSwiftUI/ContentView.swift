//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by admin on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select string: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 42") {
                    path.append(42)
                }
                Button("Push Hi") {
                    path.append("Hi")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
