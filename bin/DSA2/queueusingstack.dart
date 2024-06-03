class Queue {
  List<int> inbox = [];
  List<int> outbox = [];

  void enqueue(int data) {
    inbox.add(data);
  }

  dequeue() {
    if (inbox.isEmpty && outbox.isEmpty) {
      return null;
    }
    while (inbox.isNotEmpty) {
      outbox.add(inbox.removeLast());
    }
    outbox.removeLast();
    while (outbox.isNotEmpty) {
      inbox.add(outbox.removeLast());
    }
  }

  void display() {
    print(inbox);
  }
}

void main() {
  Queue queue = Queue();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  print("Queue after enqueuing:");
  queue.display();

  print("Dequeued element: ${queue.dequeue()}");

  print("Queue after dequeuing:");
  // queue.enqueue(98);
  queue.display();
}
