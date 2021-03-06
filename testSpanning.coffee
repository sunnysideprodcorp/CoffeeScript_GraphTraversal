# making a new Graph object
links = [{id: 0, to: 1, from:5, weight:99}, {id: 1, to: 1, from:2, weight:2},{id: 2, to: 1, from:3, weight:2},{id: 3, to: 3, from:5, weight:1},{id: 4, to: 2, from:4, weight:1},{id: 5, to: 4, from:3, weight:5},{id: 6, to: 1, from:0, weight:10}, ]
nodes = [0...6]
graph = new Graph nodes, links


# result of Kruskal's algorithm to find minimum spanning tree
results = kruskal graph
console.log "edges in Kruskal minimum spanning tree are: " + results

# result of Prim's algorithm to find minimum spanning tree from startNode
startNode = 0
results = prim graph, startNode
console.log "edges in Prim minimum spanning tree are: " + results + " starting from node " + startNode

# result of Djikstra's algorithm from startNode, discovering shortest path from every other node to startNode
results = djikstra graph, startNode
for i in [1...graph.nodes.length]
    if i != startNode
        console.log "Djikstra results starting from node " + startNode + " to node " + i + " gives a minimum distance of " + results.distances[i] + " where the path back from " + i + " would first traverse " + results.parents[i] + " en route back to " + startNode 
