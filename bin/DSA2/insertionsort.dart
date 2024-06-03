void insertionSort(List<int> arr) {
  int numbertoinsert, j;
  for (int i = 0; i < arr.length; i++) {
    numbertoinsert = arr[i];
    j = i - 1;
    while (j >= 0 && arr[j] > numbertoinsert) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = numbertoinsert;
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6];
  insertionSort(arr);
  print(arr);
}
