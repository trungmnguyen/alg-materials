// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 # Prim's Algorithm Challenges
 
 ## 1. Construct a MST with points
 
 Given a set of points, construct a minimum spanning tree connecting the points into a graph.
 ![Graph](challenge1.png)
 */

import UIKit

extension CGPoint: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }
}

extension CGPoint {
    
    func distanceSquared(to point: CGPoint) -> CGFloat {
        let xDistance = (x - point.x)
        let yDistance = (y - point.y)
        
        return xDistance * xDistance + yDistance * yDistance
    }
    
    func distance(to point: CGPoint) -> CGFloat {
        distanceSquared(to: point).squareRoot()
    }
}

extension Prim where T == CGPoint {
    
    public func createCompleteGraph(with points: [CGPoint]) -> Graph {
        let completeGraph = Graph()
        
        points.forEach { point in
            completeGraph.createVertex(data: point)
        }
        
        completeGraph.vertices.forEach {currentVertex in
            completeGraph.vertices.forEach { vertex in
                if currentVertex != vertex {
                    let distance = Double(currentVertex.data.distance(to: vertex.data))
                    completeGraph.addDirectedEdge(from: currentVertex, to: vertex, weight: distance)
                }
            }
        }
        return completeGraph
    }
  
  public func produceMinimumSpanningTree(with points: [CGPoint]) -> (cost: Double, mst: Graph) {
    let completeGraph = createCompleteGraph(with: points)
    return produceMinimumSpanningTree(for: completeGraph)
  }
}

let points = [CGPoint(x: 4, y: 0), // 0
              CGPoint(x: 6, y: 16), // 1
              CGPoint(x: 10, y: 1), // 2
              CGPoint(x: 3, y: 17), // 3
              CGPoint(x: 18, y: 7), // 4
              CGPoint(x: 5, y: 14)] // 5

let (cost,mst) = Prim().produceMinimumSpanningTree(with: points)

print(mst)
print(cost)
//: ### Sample Test Case
//: ![Table](challenge1_final.png)

