import 'dart:math';

final class Radixsort {
  static final int _minInteger = -0x8000000000000000;
  Radixsort._() {}

  static List<int> sort(List<int> lst) {
    return _sort(lst, 1);
  }

  static List<List<int>> _initRadicesArr() {
    return List<List<int>>.generate(
        10, (_) => new List<int>.empty(growable: true));
  }

  static List<int> _sort(List<int> lst, int radix) {
    List<int> sorted = List.from(lst);
    List<List<int>> radices;
    int maxRadix = lst.fold(Radixsort._minInteger,
        (p, c) => max(p, pow(10, c.toString().length).toInt()));

    for (int radix = 10; radix <= maxRadix; radix *= 10) {
      radices = _initRadicesArr();

      for (int e in sorted) {
        radices[((e % radix) / (radix / 10)).floor()].add(e);
      }

      sorted = radices.fold(
          new List<int>.empty(growable: true), (p, c) => [...p, ...c]);
    }

    return sorted;
  }
}
