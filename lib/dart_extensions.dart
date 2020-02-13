library dart_extensions;

import 'dart:collection';

import 'dart:core';

class Pair<T, U> {
  Pair(this.left, this.right);

  final T left;
  final U right;

  String toString() => 'Pair[$left, $right]';

  List<T> toList() => U is T ? listOf([left, right as T]) : null;
}

List<T> listOf<T>(Iterable<T> list) => List<T>().also((it) => it.addAll(list));

repeat(int times, void action(int)) {
  for (int i = 0; i < times; i++) {
    action(i);
  }
}

ReturnType run<ReturnType>(ReturnType operation()) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType operation_for(T self)) {
    return operation_for(this);
  }

  T also(void operation_for(T self)) {
    operation_for(this);
    return this;
  }
}

extension StringExtensions on String {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  bool isNotNullOrEmpty() {
    return this != null && this.isNotEmpty;
  }

  String reversed() {
    var res = "";
    for (int i = length; i >= 0; --i) {
      res = this[i];
    }
    return res;
  }

  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  bool toBoolean() => this.toLowerCase() == "true";
}

extension BooleanExtensions on bool {
  bool not() {
    return !this;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  bool isNotNullOrEmpty() {
    return this != null && this.isNotEmpty;
  }

}
extension ListExtensions<T> on List<T> {
  List<T> distinctBy<K>(K block(T obj)) {
    var set = HashSet<K>();
    var list = List<T>();
    for (var e in this) {
      var key = block(e);
      if (set.add(key)) {
        list.add(e);
      }
    }
    return list;
  }
}
