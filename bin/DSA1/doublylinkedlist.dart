////////doubly linked list////////////////

class Node {
  int? data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;
//////////////add node///////////////////

  void addnode(int data) {
    Node newnode = Node(data);
    if (head == null) {
      head = newnode;
    } else {
      tail!.next = newnode;
      newnode.prev = tail;
    }
    tail = newnode;
  }

//////////forward display/////////////////

  void displaynode() {
    Node? temp = head;
    if (head == null) {
      print("null");
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

/////////////reverse display////////////////////
  void displaynodereverse() {
    Node? temp = tail;
    if (head == null) {
      print("null");
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.prev;
      }
    }
  }
}

void main() {
  LinkedList list = LinkedList();
  list.addnode(10);
  list.addnode(20);
  list.addnode(30);
  list.addnode(40);
  list.displaynode();
  list.displaynodereverse();
}
