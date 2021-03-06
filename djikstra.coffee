
# Djikstras algorithm as a simple modification to Prims algorithm
djikstra = (graph, startNode) ->
   # record-keeping arrays
   distance = new Array(graph.numNodes).fill(Graph.maxWeight)
   intree = new Array(graph.numNodes).fill(-1)
   link = Array.from(intree)
   parent = Array.from(intree)

   distance[startNode] = 0
   links = []
   linkAdd = -1
   currentNode = startNode

   while intree[currentNode] < 0
      # add new node and new edge to record of edges/nodes
      intree[currentNode] = 1
      linkAdd = link[currentNode]
      links.push linkAdd if linkAdd > 0

      # update any distances to tree that have become shorter with addition of new node
      p = graph.linksDir[currentNode]
      for k,v of p
          weight = graph.edgeWeights[v]
          if distance[k] >  weight + distance[currentNode]
              distance[k] = weight + distance[currentNode]
              link[k] = v
              parent[k] = currentNode

      # determine which node is now closest to tree and add it
      dist = Graph.maxWeight
      for i in [0...graph.numNodes]
          if intree[i] < 0 and dist > distance[i]
              dist = distance[i]
              currentNode = i
              linkAdd = link[i]
   return {distances: distance, parents : parent}

