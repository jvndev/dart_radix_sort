import 'RadixSort.dart';
import 'dart:math';

List<int> createTestDataArr(int len, int max) {
  Random rnd = new Random();

  return new List<int>.filled(len, 0)
      .map<int>((_) => rnd.nextInt(max))
      .toList();
}

bool testArr(List<int> arr) {
  bool isSorted = true;

  for (int i = 1; i < arr.length; i++) isSorted &= arr[i] >= arr[i - 1];

  return isSorted;
}

void main() {
  List<int> dataArr = createTestDataArr(20, 9999),
      sortedArr = Radixsort.sort(dataArr);

  print(dataArr);
  print(sortedArr);

  assert(testArr(sortedArr), 'Array sort failed');
}
