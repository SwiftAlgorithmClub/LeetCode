//
//  Edge.swift
//  LeetCode
//
//  Created by tskim on 2019/10/27.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

public class Edge: Equatable {
    public var neighbor: Node
    
    public init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
