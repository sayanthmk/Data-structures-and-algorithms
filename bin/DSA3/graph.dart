class Graph {
  late Map<int, List<int>> adjestencylist;
  Graph() {
    adjestencylist = {};
  }
  void addvertex(vertex) {
    if (!adjestencylist.containsKey(vertex)) {
      adjestencylist[vertex] = [];
    }
  }

  addedges(vertex1, vertex2) {
    if (!adjestencylist.containsKey(vertex1)) {
      addvertex(vertex1);
    }
    if (!adjestencylist.containsKey(vertex2)) {
      addvertex(vertex2);
    }

    adjestencylist[vertex1]!.add(vertex2);
    adjestencylist[vertex2]!.add(vertex1);
  }

  //////////////////Graph DFS//////////////////////////

  List<int> dfsIterative(int startingVertex) {
    Map<int, bool> visited = {};
    List<int> result = [];
    List<int> stack = [startingVertex];

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      if (!visited.containsKey(currentVertex)) {
        visited[currentVertex] = true;
        result.add(currentVertex);
        for (int neighbor in adjestencylist[currentVertex]!) {
          stack.add(neighbor);
        }
      }
    }
    return result;
  }

/////////////////Graph BFS//////////////////////////

  List<int> bfs(int startingVertex) {
    Map<int, bool> visited = {startingVertex: true};
    List<int> result = [];
    List<int> queue = [startingVertex];

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeAt(0);
      result.add(currentVertex);

      for (int neighbor in adjestencylist[currentVertex]!) {
        if (!visited.containsKey(neighbor)) {
          visited[neighbor] = true;
          queue.add(neighbor);
        }
      }
    }

    return result;
  }

  display() {
    adjestencylist.forEach((key, value) {
      print('$key:$value');
    });
  }

/////////find the connections b/w nodes/////////////////

  hasedge(vertex1, vertex2) {
    return (adjestencylist[vertex1]!.contains(vertex2) &&
        adjestencylist[vertex2]!.contains(vertex1));
  }

/////////delete the connection between nodes////////////

  removeedge(vertex1, vertex2) {
    adjestencylist[vertex1]!.remove(vertex2);
    adjestencylist[vertex2]!.remove(vertex1);
  }
////////////////remove the vertex//////////////////

  removevertex(vertex) {
    if (!adjestencylist.containsKey(vertex)) {
      return;
    }
    for (var addjacentvertex in adjestencylist[vertex]!) {
      removeedge(vertex, addjacentvertex);
    }
    adjestencylist.remove(vertex);
  }
}

void main() {
  Graph graph = Graph();
  graph.addvertex(1);
  graph.addvertex(2);
  graph.addvertex(3);
  graph.addvertex(4);
  graph.addedges(1, 2);
  graph.addedges(1, 3);
  graph.addedges(2, 4);
  graph.display();
  print(graph.dfsIterative(1));
  // print(graph.hasedge(2, 3));
  // graph.removevertex(4);
}
