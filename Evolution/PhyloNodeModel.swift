//
//  PhyloNodeModel.swift
//  Evolution
//
//  Created by Jeffrey Michael Flynn on 2/9/24.
//

import Foundation

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


