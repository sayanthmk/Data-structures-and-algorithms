selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        int temp = arr[minIndex];
        arr[minIndex] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}

void main() {
  List<int> arr = [2, 8, 1, 44, 9, 23];
  selectionSort(arr);
  print(arr);
}
