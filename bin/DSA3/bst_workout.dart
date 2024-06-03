class TreeNode {
  String name;
  String id;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.name, this.id);
}

class BST {
  TreeNode? root;

  TreeNode _insertRec(TreeNode? root, String name, String id) {
    if (root == null) {
      return TreeNode(name, id);
    }

    if (id.compareTo(root.id) < 0) {
      root.left = _insertRec(root.left, name, id);
    } else if (id.compareTo(root.id) > 0) {
      root.right = _insertRec(root.right, name, id);
    }

    return root;
  }

  void insert(String name, String id) {
    root = _insertRec(root, name, id);
  }

  TreeNode? _searchRec(TreeNode? root, String id) {
    if (root == null || root.id == id) {
      return root;
    }

    if (id.compareTo(root.id) < 0) {
      return _searchRec(root.left, id);
    }

    return _searchRec(root.right, id);
  }

  TreeNode? search(String id) {
    return _searchRec(root, id);
  }
}

void main() {
  BST bst = BST();

  bst.insert("Rahul", "101");
  bst.insert("vijitha", "102");
  bst.insert("sayanth", "103");

  String searchId = "102";
  TreeNode? result = bst.search(searchId);

  if (result != null) {
    print("Name: ${result.name}, ID: ${result.id}");
  } else {
    print("Object with ID $searchId not found.");
  }
}
