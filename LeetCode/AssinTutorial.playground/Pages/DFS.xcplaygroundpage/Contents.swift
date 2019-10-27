/*:
 # Depth-First Search
 깊이 우선 검색 (DFS)은 트리 또는 그래프 데이터 구조를 탐색하거나 검색하기위한 알고리즘입니다.
 소스 노드에서 시작하여 역 추적 전에 각 분기를 따라 가능한 한 탐색합니다.
 깊이 우선 검색은 유 방향 그래프와 무향 그래프 모두에 사용할 수 있습니다.
 
 ![DFS](https://github.com/raywenderlich/swift-algorithm-club/raw/master/Depth-First%20Search/Images/AnimatedExample.gif)
 
 
 */


let graph = Graph()

let node0 = graph.addNode("0")
let node1 = graph.addNode("1")
let node2 = graph.addNode("2")
let node3 = graph.addNode("3")

graph.addEdge(node0, neighbor: node1)
graph.addEdge(node0, neighbor: node2)
graph.addEdge(node1, neighbor: node2)
graph.addEdge(node2, neighbor: node0)
graph.addEdge(node2, neighbor: node3)
graph.addEdge(node3, neighbor: node3)


func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var nodesExplored = [source.label]
     // 현재 노드를 방문한 것으로 표시합니다
    source.visited = true
    
//    시작 노드에서 인접 노드가 있을 때 까지 반복합니다.
    for edge in source.neighbors {
        // 노드를 방문한적이 없다면
        if !edge.neighbor.visited {
           // 인접 노드는 재귀로 탐색을 합니다.
            nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
        }
    }
    return nodesExplored
}


let nodesExplored = depthFirstSearch(graph, source: node2)
print(nodesExplored)
