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

// Define the PhyloNode to represent each node in the phylogenetic tree
struct PhyloNode: Identifiable {
    var id = UUID()
    var name: String
    var level: String
    var children: [PhyloNode] = []
}

// Sample data for the phylogenetic tree
let sampleTree = PhyloNode(
    name: "Life",
    level: "Domain",
    children: [
        PhyloNode(
            name: "Protista",
            level: "Kingdom",
            children: []
            ),
        PhyloNode(
            name: "Plantae",
            level: "Kingdom",
            children: []
            ),
        PhyloNode(
            name: "Eukarya",
            level: "Kingdom",
            children: [
                PhyloNode(
                    name: "Animalia",
                    level: "Phylum",
                    children: [
                        PhyloNode(name: "Chordata", level: "Class", children: [
                            PhyloNode(name: "Mammalia", level: "Order", children: [
                                PhyloNode(name: "Primates", level: "Family", children: [
                                    PhyloNode(name: "Hominidae", level: "Genus", children: [
                                        PhyloNode(name: "Homo", level: "Species", children: [
                                            PhyloNode(name: "Homo sapiens", level: "Individual"),
                                            PhyloNode(name: "Homo habilis", level: "Individual"),
                                            PhyloNode(name: "Homo rudolfensis", level: "Individual"),
                                            PhyloNode(name: "Homo antecessor", level: "Individual"),
                                            PhyloNode(name: "Homo heidelbergensis", level: "Individual"),
                                            PhyloNode(name: "Homo floresiensis", level: "Individual"),
                                            PhyloNode(name: "Homo neanderthalensis", level: "Individual"),
                                            PhyloNode(name: "Homo naledi", level: "Individual"),
                                        ])
                                    ])
                                ])
                            ])
                        ])
                    ])
            ])
    ])


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
