class Stack {
  List<int> arr = [];
  //////insert into the stack////////////////

  push(data) {
    arr.add(data);
  }

////////////remove from the stack///////////////
  pop() {
    if (arr.isEmpty) {
      print("stack is empty");
    }
    arr.removeLast();
  }

////////////display the stack////////////////
  display() {
    if (arr.isEmpty) {
      print("stack is empty");
    } else {
      for (int i = arr.length - 1; i >= 0; i--) {
        print(arr[i]);
      }
    }
  }

////////////delete middle element//////////////////
  deletemid() {
    int middle = arr.length ~/ 2;
    List<int> temp = [];
    int count = 0;
    while (arr.isEmpty) {
      int current = pop();
      if (count != middle) {
        temp.add(current);
      }
      count++;
    }
    while (temp.isNotEmpty) {
      push(temp.removeLast());
    }
  }

////////////reverse the stack///////////////
  bool isEmpty() {
    return arr.isEmpty;
  }

  reverse(String input) {
    Stack stack = Stack();
    for (int i = 0; i < input.length; i++) {
      stack.push(input[i]);
    }
    String reversed = '';
    while (!stack.isEmpty()) {
      reversed += stack.pop();
    }
    return reversed;
  }
}

void main() {
  Stack st = Stack();
  st.push(40);
  st.push(80);
  st.push(90);
  st.push(50);
  // st.pop();
  st.deletemid();
  st.display();
}
