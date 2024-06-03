class Trie {
  Map<String, Trie> children = {};
  bool isEndOfWord = false;

  void insert(String word) {
    var currentNode = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!currentNode.children.containsKey(s)) {
        currentNode.children[s] = Trie();
      }
      currentNode = currentNode.children[s]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    var currentNode = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!currentNode.children.containsKey(s)) {
        return false;
      }
      currentNode = currentNode.children[s]!;
    }
    return currentNode.isEndOfWord;
  }

  Trie? _findNode(String prefix) {
    Trie currentNode = this;
    for (int i = 0; i < prefix.length; i++) {
      String s = prefix[i];
      if (!currentNode.children.containsKey(s)) {
        return null;
      }
      currentNode = currentNode.children[s]!;
    }
    return currentNode;
  }

  void _collectAllWords(Trie node, String prefix, List<String> result) {
    if (node.isEndOfWord) {
      result.add(prefix);
    }
    node.children.forEach((char, child) {
      _collectAllWords(child, prefix + char, result);
    });
  }

  List<String> autocomplete(String prefix) {
    List<String> result = [];
    Trie? node = _findNode(prefix);
    if (node != null) {
      _collectAllWords(node, prefix, result);
    }
    return result;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("hello");
  trie.insert("hell");
  trie.insert("heaven");
  trie.insert("heavy");

  print(trie.autocomplete("he")); // Output: [hello, hell, heaven, heavy]
  print(trie.autocomplete("hel")); // Output: [hello, hell]
  print(trie.autocomplete("hea")); // Output: [heaven, heavy]
  print(trie.autocomplete("h")); // Output: [hello, hell, heaven, heavy]
  print(trie.autocomplete("ho")); // Output: []
}
