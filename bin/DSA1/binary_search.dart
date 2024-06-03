int binarysearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;
  while (low <= high) {
    int mid = (low + high) ~/ 2;
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 45, 7, 8, 9, 10];
  arr.sort();
  int target = 6;
  int index = binarysearch(arr, target);
  if (index != -1) {
    print("$index");
  } else {
    print("empty");
  }
}
