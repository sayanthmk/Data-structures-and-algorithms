// //PRIME OR NOT

int checkprime(int i, int num) {
  if (num == i) {
    return 0;
  } else {
    if (num % i == 0) {
      return 1;
    } else {
      return checkprime(i + 1, num);
    }
  }
}

void main() {
  int num = 8;
  checkprime(2, 3);
  if (checkprime(2, num) == 0) {
    print("prime");
  } else {
    print("not");
  }
}
