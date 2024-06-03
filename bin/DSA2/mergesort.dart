mergesort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }
  int mid = ((arr.length) / 2).floor();
  List<int> leftArr = arr.sublist(0, mid);
  List<int> rightArr = arr.sublist(mid, arr.length);
  return merge(mergesort(leftArr), mergesort(rightArr));
}

merge(List<int> leftarr, List<int> rightarr) {
  List<int> sortedarr = [];
  while (leftarr.isNotEmpty && rightarr.isNotEmpty) {
    if (leftarr[0] < rightarr[0]) {
      sortedarr.add(leftarr.removeAt(0));
    } else {
      sortedarr.add(rightarr.removeAt(0));
    }
  }
  return [...sortedarr, ...leftarr, ...rightarr];
}

void main() {
  List<int> arr = [3, 7, 2, 9, 44, 8, 1];
  print(mergesort(arr));
}
