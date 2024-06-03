class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  void enqueue(int data) {
    Node newnode = Node(data);
    if (rear == null) {
      front = rear = newnode;
      return;
    } else {
      rear!.next = newnode;
      rear = newnode;
    }
  }

  void dequeue() {
    if (front == null) {
      print("empty");
    }
    front = front!.next;
    if (front == null) {
      rear = null;
    }
  }

  void display() {
    Node? current = front;
    if (front == null) {
      print("list is empty");
    }
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  // queue.dequeue();
  queue.display();
}
