void main() {
  List<int> array = [14, 27, 3, 14, 55, 6];
  int temp = 0;
  for (int i = 0; i < array.length; i++) {
    for (int j = i + 1; j < array.length; j++) {
      if (array[j] < array[i]) {
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }
  }
  print(array);
}
