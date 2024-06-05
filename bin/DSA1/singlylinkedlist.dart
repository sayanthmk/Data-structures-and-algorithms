/////////singly linked list///////////////////////

class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;
  ///////////////////addnode////////////////////

  void addnodel(int data) {
    Node newnodel = Node(data);
    if (head == null) {
      head = newnodel;
    } else {
      tail!.next = newnodel;
    }
    tail = newnodel;
  }
///////add node in head///////////////////////

  void addhead(int data) {
    Node? newnode1 = Node(data);
    if (head == null) {
      newnode1 = head;
    } else {
      newnode1.next = head;
      head = newnode1;
    }
  }
//////////////////display/////////////////////

  void dis() {
    if (head == null) {
      print("null");
    } else {
      Node? temp = head;
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }
  //////delete the first node///////////////////////

  void deletefirst() {
    if (head == null) {
      print("list is empty");
    } else {
      head = head!.next;
    }
  }
////////////delete last of the node/////////////

  void deletelast() {
    if (head == null) {
      print("lsit is empty");
    }
    if (head!.next == null) {
      head = null;
      return;
    }
    Node secondlast = head!;
    Node lastnode = head!.next!;
    while (lastnode.next != null) {
      lastnode = lastnode.next!;
      secondlast = secondlast.next!;
      return;
    }
  }

/////////////delete the node ///////////////////////////////////
  void delete(int data) {
    Node? temp = head, prev;
    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }
    while (temp != null && temp != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail!.next = null;
      return;
    }
    prev!.next = temp.next;
  }

///////////////insert middle /////////////////

  void insertafter(int nextTo, int data) {
    Node newnode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail!.next = newnode;
      tail = newnode;
      return;
    }
    newnode.next = temp.next;
    temp.next = newnode;
  }
///////////////search by value////////////////////

  searchbyvalue(int data) {
    Node? temp = head;
    while (temp != null) {
      if (temp.data == data) {
        return true;
      }
      temp = temp.next;
    }
    return false;
  }
  ///////////////search by index////////////////////

  searchbyposition(int index) {
    Node? temp = head;
    for (int i = 0; i <= index; i++) {
      if (i == index) {
        return temp!.data;
      }
      temp = temp!.next;
    }
    return false;
  }
/////////remove duplicates elements///////////////////

  void removeduplicate() {
    Node? current = head;
    while (current != null) {
      Node? next = current.next;
      while (next != null && next.data != current.data) {
        next = next.next;
      }
      current.next = next;
      if (next == tail) {
        tail = current;
      }
    }
  }

  ////////////reverse////////////////////

  reverse() {
    Node? prev;
    Node? current = head;
    while (current != null) {
      Node? temp = current.next;
      current.next = prev;
      prev = current;
      current = temp;
    }
    head = prev;
  }

////////////middle element////////////////////
  mid() {
    Node? slowpointer = head;
    Node? fastpointer = head;
    if (fastpointer != null && fastpointer.next != null) {
      slowpointer = slowpointer!.next;
      fastpointer = fastpointer.next!.next;
    }
    return slowpointer;
  }
}

void main() {
  LinkedList list = LinkedList();
  list.addnodel(20);
  list.addnodel(270);
  list.addnodel(270);
  list.addnodel(270);
  list.addnodel(370);
  list.addnodel(40);
  list.addnodel(50);
  list.addnodel(50);
  list.addnodel(50);
  list.addnodel(50);
  list.insertafter(50, 10202);
  list.delete(20);
  list.removeduplicate();
  list.dis();
}
