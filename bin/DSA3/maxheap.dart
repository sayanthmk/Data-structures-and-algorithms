class Heap {
  List<int> heap = [];
  void swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  int? peek() {
    if (heap.isEmpty) {
      return null;
    }
    return heap[0];
  }

  void heapifyup() {
    int index = heap.length - 1;
    while (hasparent(index) && heap[getparentindex(index)] > heap[index]) {
      swap(getparentindex(index), index);
      index = getparentindex(index);
    }
  }

  void addnewwlement(int value) {
    heap.add(value);
    heapifyup();
  }

  int? remove() {
    if (heap.isEmpty) {
      return null;
    }
    int item = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifydown();
    return item;
  }

  int? remove2(int value) {
    int index = heap.indexOf(value);
    if (index == -1) {
      return null;
    }

    swap(index, heap.length - 1);
    int removed = heap.removeLast();

    heapifydown();

    return removed;
  }

  buildHeap(arr) {
    List<int> heap = arr;
    int value = ((heap.length / 2) - 1).floor();
    for (int i = value; i >= 0; i--) {
      heapifydown();
    }
  }

  void heapifydown() {
    int index = 0;
    while (hasleftchild(index)) {
      int smallerchild = getleftchildindex(index);
      if (hasrightchild(index) && getrightchild(index) < getleftchild(index)) {
        smallerchild = getrightchildindex(index);
      }
      if (heap[index] < heap[smallerchild]) {
        break;
      } else {
        swap(index, smallerchild);
      }
      index = smallerchild;
    }
  }

///////////////////////equations/////////////////

  bool hasparent(int index) {
    return index > 0;
  }

  int getparentindex(int index) {
    return ((index - 1) / 2).floor();
  }

  int getparent(int index) {
    return heap[getparentindex(index)];
  }

  bool hasleftchild(int index) {
    return 2 * index + 1 < heap.length;
  }

  int getleftchildindex(int index) {
    return 2 * index + 1;
  }

  int getleftchild(int index) {
    return heap[getleftchildindex(index)];
  }

  bool hasrightchild(int index) {
    return 2 * index + 2 < heap.length;
  }

  int getrightchildindex(int index) {
    return 2 * index + 2;
  }

  int getrightchild(int index) {
    return heap[getleftchildindex(index)];
  }

  void display() {
    print(heap);
  }
}

void main() {
  Heap minheap = Heap();
  minheap.addnewwlement(3);
  minheap.addnewwlement(7);
  minheap.addnewwlement(12);
  minheap.addnewwlement(2);
  minheap.addnewwlement(1);
  minheap.display();
  // List<int> arr = [1, 5, 8, 2, 9, 3];
  // minheap.buildHeap(arr);
  // minheap.display();
}
