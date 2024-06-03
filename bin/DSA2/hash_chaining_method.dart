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

  void set(String key, dynamic value) {
    int index = hash(key);
    Node? newnode = table[index];
    if (newnode == null) {
      table[index] = Node(key, value);
    } else {
      while (newnode?.next != null) {
        newnode = newnode?.next;
      }
      newnode?.next = Node(key, value);
    }
  }

  dynamic get(String key) {
    int index = hash(key);
    Node? newnode = table[index];
    while (newnode != null) {
      if (newnode.key == key) {
        return newnode.value;
      }
      newnode = newnode.next;
    }
    return null;
  }

  void remove(String key) {
    int index = hash(key);
    Node? current = table[index];
    Node? prev;
    while (current != null) {
      if (current.key == key) {
        if (prev == null) {
          table[index] = current.next;
        } else {
          prev.next = current.next;
        }
        break;
      }
      prev = current;
      current = current.next;
    }
  }

  void display() {
    for (int i = 0; i < table.length; i++) {
      Node? newnode = table[i];
      if (newnode != null) {
        print('index $i');
      }
      while (newnode != null) {
        print("${newnode.key}:${newnode.value}");
        newnode = newnode.next;
      }
    }
  }
}

void main() {
  Stack queue = Stack();
  queue.set('name', 'sayanth');
  queue.set('mane', 'adithyan');
  queue.set('name', 'vishnu');
  queue.set('emane', 'nahyan');
  queue.set('age', '21');
  queue.set('ega', '21');
  queue.remove('name');
  print(queue.get('name'));
  queue.set('class', 'degree');
  queue.display();
}
