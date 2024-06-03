bool isprime(int n, int i) {
  if (n <= 2) {
    return (n == 2);
  }
  if (n % i == 0) {
    return false;
  }

  if (i * i > n) {
    return true;
  }
  return isprime(n, i + 1);
}

void main() {
  int number = 7;
  bool prime = isprime(number, 2);
  if (prime) {
    print("$number is a prime");
  } else {
    print("$number is not prime");
  }
}
