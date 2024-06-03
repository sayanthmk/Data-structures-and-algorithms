///FIBONACCI USING RECURTION///

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  int number = 10;
  print("fibannoci sequence upto $number");
  for (int i = 0; i < number; i++) {
    print(fibonacci(i));
  }
}
