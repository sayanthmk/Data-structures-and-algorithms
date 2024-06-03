int sumofnumbers(int n) {
  if (n == 0) {
    return 0;
  }
  return n + sumofnumbers(n - 1);
}

void main() {
  int number = 3;
  int sum = sumofnumbers(number);
  print("sum of first $number natural umbers is $sum");
}
