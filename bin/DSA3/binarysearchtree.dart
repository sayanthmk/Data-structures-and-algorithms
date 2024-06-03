import 'dart:math';

class Node {
  dynamic value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BST {
  Node? root;
  bool isempty() {
    return root == null;
  }

//insert the value

  insert(value) {
    Node newNode = Node(value);
    if (isempty()) {
      root = newNode;
    } else {
      insertnode(root, newNode);
    }
  }

//insert helper

  insertnode(root, newvalue) {
    if (newvalue.value < root.value) {
      if (root.left == null) {
        root.left = newvalue;
      } else {
        insertnode(root.left, newvalue);
      }
    } else {
      if (root.right == null) {
        root.right = newvalue;
      } else {
        insertnode(root.right, newvalue);
      }
    }
  }

//search the node

  search(root, value) {
    if (root == null) {
      return false;
    } else {
      if (root.value == value) {
        return true;
      } else if (value < root.value) {
        return search(root.left, value);
      } else {
        return search(root.right, value);
      }
    }
  }

//////////////DFS Traversal/////////////////////////////////////

  preorder(root) {
    if (root != null) {
      print(root.value);
      preorder(root.left);
      preorder(root.right);
    }
  }

  inorder(root) {
    if (root != null) {
      inorder(root.left);
      print(root.value);
      inorder(root.right);
    }
  }

  postorder(root) {
    if (root != null) {
      postorder(root.left);
      postorder(root.right);
      print(root.value);
    }
  }

///////////////////BFS Traversal/////////////////////

  levelorder() {
    List<Node?> queue = [];
    queue.add(root);
    while (queue.isNotEmpty) {
      var curr = queue.removeAt(0);
      print(curr!.value);
      if (curr.left != null) {
        queue.add(curr.left);
      }
      if (curr.right != null) {
        queue.add(curr.right);
      }
    }
  }

//////////Minimum value in the BST////////////////////
  minvalue(root) {
    if (root.left == null) {
      return root.value;
    } else {
      return minvalue(root.left);
    }
  }

//////////Maximum value in the BST////////////////////
  maxvalue(root) {
    if (root.right == null) {
      return root.value; ////////base case
    } else {
      return maxvalue(root.right);
    }
  }
////////////////delete node////////////////////

  delete(value) {
    root = deletenode(root, value);
  }

  deletenode(root, value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = deletenode(root.left, value);
    } else if (value > root.value) {
      root.right = deletenode(root.right, value);
    } else {
      if (root.left == null && root.right == null) {
        return null;
      }
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = minvalue(root.right);
      root.right = deletenode(root.right, value);
    }
    return root;
  }

  ///////////height of the tree////////////////////
  height(root) {
    if (root == null) {
      return -1;
    }
    int leftheight = height(root.left);
    int rightheight = height(root.right);
    return max(leftheight, rightheight) + 1;
  }
}

void main() {
  BST bst = BST();
  // print(bst.isempty());
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  // bst.levelorder();
  // // bst.insert(7);
  // // print(bst.search(bst.root, 20));
  // // print(bst.search(bst.root, 20));
  // // print(bst.search(bst.root, 10));
  // // bst.postorder(bst.root);
  // // bst.levelorder();
  // // print(bst.min(bst.root));
  // // print(bst.max(bst.root));
  // bst.levelorder();
  // bst.delete(10);
  // bst.levelorder();
  // print("-----");
  // bst.add(5);

  // List<List<int>> arr = [
  //   [6, 6],
  //   [6, 7]
  // ];
  // bst.twoarray(arr);
  // bst.add(3);
}
