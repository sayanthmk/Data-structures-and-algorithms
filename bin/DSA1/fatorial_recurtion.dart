// ////FACTORIAL USING RECURSION/////////

int factorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * factorial(n - 1);
}

void main() {
  int number = 6;
  int result = factorial(number);
  print("factorial of $number is $result");
}
