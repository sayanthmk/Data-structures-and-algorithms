class Trie {
  Map<String, Trie> children = {};
  bool isendofword = false;

  insert(String word) {
    Trie currentnode = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!currentnode.children.containsKey(s)) {
        currentnode.children[s] = Trie();
      }
      currentnode = currentnode.children[s]!;
    }
    currentnode.isendofword = true;
  }

  bool search(String word) {
    var currentnode = this;
    for (int i = 0; i < word.length; i++) {
      String s = word[i];
      if (!currentnode.children.containsKey(s)) {
        return false;
      }
      currentnode = currentnode.children[s]!;
    }
    return currentnode.isendofword;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("hello");
  trie.insert("hell");
  trie.insert("heaven");
  trie.insert("heavy");
  print(trie.search("hello"));
}
