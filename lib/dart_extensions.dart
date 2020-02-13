library dart_extensions;

import 'dart:collection';
import 'dart:core';

/// Represents a generic pair of two values.
class Pair<T, U> {
  Pair(this.left, this.right);

  final T left;
  final U right;

  String toString() => 'Pair[$left, $right]';

  List<T> toList() => U is T ? listOf([left, right as T]) : null;
}

/// To create list from [Iterable]
List<T> listOf<T>(Iterable<T> list) => List<T>().also((it) => it.addAll(list));

/// Executes the given function [action] specified number of [times].
repeat(int times, void action(int)) {
  for (int i = 0; i < times; i++) {
    action(i);
  }
}

/// Calls the specified function [operation] with `this` value as its receiver and returns its result.
ReturnType run<ReturnType>(ReturnType operation()) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  /// Calls the specified function [operation] with `this` value as its argument and returns its result.
  ReturnType let<ReturnType>(ReturnType operation(T self)) {
    return operation(this);
  }

  /// Calls the specified function [operation] with `this` value as its argument and returns `this` value.
  T also(void operation(T self)) {
    operation(this);
    return this;
  }
}

extension StringExtensions on String {
  /// Returns `true` if this nullable char sequence is either `null` or empty.
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  /// Returns `false` if this nullable char sequence is either `null` or empty.
  bool isNotNullOrEmpty() {
    return this != null && this.isNotEmpty;
  }

  /// Returns a progression that goes over the same range in the opposite direction with the same step.
  String reversed() {
    var res = "";
    for (int i = length; i >= 0; --i) {
      res = this[i];
    }
    return res;
  }

  /// Returns the value of this number as an [int]
  int toInt() => int.parse(this);

  /// Returns the value of this number as an [int] or null if can not be parsed.
  int toIntOrNull() {
    try {
      return int.parse(this);
    } catch (_) {
      return null;
    }
  }

  /// Returns the value of this number as an [double]
  double toDouble() => double.parse(this);

  /// Returns the value of this number as an [double] or null if can not be parsed.
  double toDoubleOrNull() {
    try {
      return double.parse(this);
    } catch (_) {
      return null;
    }
  }

  /// Returns true if 'this' is "true", otherwise - false
  bool toBoolean() => this.toLowerCase() == "true";
}

extension BooleanExtensions on bool {
  /// Returns the inverse of this boolean.
  bool not() {
    return !this;
  }
}

extension IterableExtensions<T> on Iterable<T> {
  /// Returns `true` if this nullable iterable is either `null` or empty.
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  /// Returns `false` if this nullable iterable is either `null` or empty.
  bool isNotNullOrEmpty() {
    return this != null && this.isNotEmpty;
  }
}

extension ListExtensions<T> on List<T> {
  /// Returns a list containing only elements from the given collection
  // having distinct keys returned by the given [selector] function.
  //
  // The elements in the resulting list are in the same order as they were in the source collection.
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
