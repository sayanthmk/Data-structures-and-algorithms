class Node {
  String key;
  dynamic value;
  Node? next;
  Node(this.key, this.value);
}

class Stack {
  static const int tablesize = 10;
  List<Node?> table = List.filled(tablesize, null);

  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % tablesize;
  }

  set(String key, dynamic value) {
    int index = hash(key);
    Node? node = table[index];
    if (node == null) {
      table[index] = Node(key, value);
      return;
    } else {
      int newindex = (index + 1) % tablesize;
      while (newindex != index) {
        if (table[newindex] == null) {
          table[newindex] = Node(key, value);
          return;
        }
        newindex = (newindex + 1) % tablesize;
      }
      return null;
    }
  }

  dynamic get(String key) {
    int index = hash(key);
    Node? newnode = table[index];
    while (newnode != null) {
      if (newnode.key == key) {
        return newnode.value;
      }
      index = (index + 1) % tablesize;
    }
    return null;
  }

  void remove(String key) {
    int index = hash(key);
    Node? currentNode = table[index];
    Node? prevNode;

    while (currentNode != null) {
      if (currentNode.key == key) {
        if (prevNode != null) {
          prevNode.value = null;
        } else {
          table[index] = null;
        }
        return;
      }
      prevNode = currentNode;
      index = (index + 1) % tablesize;
      currentNode = table[index];
    }
  }

  void display() {
    for (int i = 0; i < table.length; i++) {
      Node? newNode = table[i];
      if (newNode != null) {
        print('Index $i:');
        while (newNode != null) {
          print("${newNode.key}: ${newNode.value}");
          newNode = newNode.next;
        }
      }
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.set('name', 'sayanth');
  stack.set('nema', 'adithyan');
  stack.set('emane', 'nahyan');
  stack.set('age', '21');
  stack.set('gea', 26);
  // stack.remove('name');
  print(stack.get('emane'));
  stack.set('class', 'degreee');
  stack.display();
}
