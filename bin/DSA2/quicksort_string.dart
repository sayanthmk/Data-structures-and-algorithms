List<String> quicksortString(List<String> arr) {
  if (arr.length < 2) {
    return arr;
  }
  String pivot = arr[arr.length - 1];
  List<String> left = [];
  List<String> right = [];
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i].compareTo(pivot) < 0) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [...quicksortString(left), pivot, ...quicksortString(right)];
}

void main() {
  List<String> array = ['banana', 'apple', 'orange', 'grape', 'kiwi'];
  print(quicksortString(array));
}
