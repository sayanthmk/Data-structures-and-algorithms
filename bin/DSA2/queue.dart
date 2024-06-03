class Queue {
  List<int> arr = [];

  enque(int data) {
    arr.add(data);
  }

  dequeue() {
    arr.removeAt(0);
  }

  display() {
    if (arr.isEmpty) {
      print("empty");
    }
    for (int i = 0; i < arr.length; i++) {
      print(arr[i]);
    }
  }
}

void main() {
  Queue queue = Queue();
  queue.display();
}
