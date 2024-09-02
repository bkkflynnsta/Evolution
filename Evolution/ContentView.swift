//
//  ContentView.swift
//  Evolution
//
//  Created by Jeffrey Michael Flynn on 19/8/24.
//

//
//  ContentView.swift
//  Evolution
//
//  Created by Jeffrey Michael Flynn on 19/8/24.
//

import SwiftUI

// First View to display the root of the tree
struct PhyloTreeView: View {
    var rootNode: PhyloNode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Phylogenetic Tree")
                    .font(.largeTitle)
                    .padding()
                
                List(rootNode.children) { childNode in
                    NavigationLink(destination: PhyloNodeDetailView(node: childNode)) {
                        Text(childNode.name)
                    }
                }
            }
            .navigationTitle(rootNode.name)
        }
    }
}

// Second View to display details and navigate deeper into the tree
struct PhyloNodeDetailView: View {
    var node: PhyloNode
    
    var body: some View {
        VStack {
            Text("\(node.level): \(node.name)")
                .font(.title)
                .padding()
            
            if !node.children.isEmpty {
                List(node.children) { childNode in
                    NavigationLink(destination: PhyloNodeDetailView(node: childNode)) {
                        Text(childNode.name)
                    }
                }
            } else {
                Text("End of this branch")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle(node.name)
    }
}

// Main App Entry Point

struct ContentView: View {
    var body: some View {
        PhyloTreeView(rootNode: sampleTree)
    }
}

#Preview {
    ContentView()
}
