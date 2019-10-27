
func breadthFirstSearch(_ graph: Graph, source: Node) -> [String] {
  var queue = Queue<Node>()
    // 최초 시작 위치를 Queue 에 담습니다.
  queue.enqueue(source)

  var nodesExplored = [source.label]
//    현재 노드를 방문한 것으로 표시합니다.
  source.visited = true

    // Queue 순회하면서 아이템을 가져옵니다.
  while let node = queue.dequeue() {
    //
    for edge in node.neighbors {
        // Node 의 첫 인접노드 하나를 가져옵니다.
      let neighborNode = edge.neighbor
        // 인접노드가 만약 방문한 적이 없다면
      if !neighborNode.visited {
        // Queue 에 인접노드를 Push 합니다.
        queue.enqueue(neighborNode)
        // Push 한 인접노드를 방문한것으로 표시합니다.
        neighborNode.visited = true
        
        // 탐색 결과에 인접노드를 추가합니다.
        nodesExplored.append(neighborNode.label)
      }
    }
  }

  return nodesExplored
}

let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)
graph.addEdge(nodeE, neighbor: nodeF)
graph.addEdge(nodeF, neighbor: nodeG)

let nodesExplored = breadthFirstSearch(graph, source: nodeA)
print(nodesExplored)
