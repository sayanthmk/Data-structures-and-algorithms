quicksort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }
  int pivot = arr[arr.length - 1];
  List<int> left = [];
  List<int> right = [];
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [...quicksort(left), pivot, ...quicksort(right)];
}

void main() {
  List<int> array = [6, 2, 9, 3, 5, 77];
  print(quicksort(array));
}
