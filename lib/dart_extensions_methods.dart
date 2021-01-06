library dart_extensions_methods;

import 'dart:collection';
import 'dart:core';

/// Represents a generic pair of two values.
class Pair<T, U> {
  Pair(this.left, this.right);

  final T left;
  final U right;

  String toString() => '($left, $right)';
}

extension PairExtensions<T> on Pair<T, T> {
  List<T> toList() => listOf([left, right]);
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
  int toIntOrNull() => int.tryParse(this);

  /// Returns the value of this number as an [double]
  double toDouble() => double.parse(this);

  /// Returns the value of this number as an [double] or null if can not be parsed.
  double toDoubleOrNull() => double.tryParse(this);

  /// Returns true if 'this' is "true", otherwise - false
  bool toBoolean() => this.toLowerCase() == "true";

  ///  Replaces part of string after the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [defaultValue] which defaults to the original string.
  String replaceAfter(String delimiter, String replacement,
      [String defaultValue]) {
    final index = indexOf(delimiter);
    return (index == -1)
        ? defaultValue.isNullOrEmpty()
            ? this
            : defaultValue
        : replaceRange(index + 1, length, replacement);
  }

  /// Replaces part of string before the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [missingDelimiterValue] which defaults to the original string.
  String replaceBefore(String delimiter, String replacement,
      [String defaultValue]) {
    final index = indexOf(delimiter);
    return (index == -1)
        ? defaultValue.isNullOrEmpty()
            ? this
            : defaultValue
        : replaceRange(0, index, replacement);
  }

  ///Returns `true` if at least one element matches the given [predicate].
  /// the [predicate] should have only one character
  bool anyChar(bool predicate(String element)) =>
      split('').any((s) => predicate(s));

  /// Returns last symbol of string or empty string if `this` is null or empty
  String get last {
    if (this.isNullOrEmpty()) return "";
    return this[length - 1];
  }

  /// Returns `true` if strings are equals without matching case
  bool equalsIgnoreCase(String other) =>
      (this == null && other == null) ||
      (this != null && other != null && toLowerCase() == other.toLowerCase());

  /// Returns `true` if string contains another without matching case
  bool containsIgnoreCase(String other) =>
      this.toLowerCase().contains(other.toLowerCase());
}

extension BooleanExtensions on bool {
  /// Returns the inverse of this boolean.
  bool not() {
    return !this;
  }

  /// Performs a logical `and` operation between this Boolean and the [other] one. Unlike the `&&` operator,
  /// this function does not perform short-circuit evaluation. Both `this` and [other] will always be evaluated.
  bool and(bool other) {
    return this && other;
  }

  /// Performs a logical `or` operation between this Boolean and the [other] one. Unlike the `||` operator,
  //  this function does not perform short-circuit evaluation. Both `this` and [other] will always be evaluated.
  bool or(bool other) {
    return this || other;
  }

  /// Performs a logical `xor` operation between this Boolean and the [other] one.
  bool xor(bool other) {
    return this != other;
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

  /// Returns `true` if at least one element matches the given [predicate].
  bool any(bool predicate(T element)) {
    if (this.isNullOrEmpty()) return false;
    for (final element in this) if (predicate(element)) return true;
    return false;
  }

  /// Returns count of elements that matches the given [predicate].
  int countWhere(bool predicate(T element)) {
    return this.where(predicate).length;
  }

  /// Convert iterable to set
  Set<T> toSet() => Set.from(this);

  /// Returns a set containing all elements that are contained
  /// by both this set and the specified collection.
  Set<T> intersect(Iterable other) {
    final set = this.toSet();
    set.retainAll(other);
    return set;
  }

  /// Returns a set containing all elements that are contained
  /// by this collection and not contained by the specified collection.
  Set<T> subtract(Iterable<T> other) {
    final set = toSet();
    set.removeAll(other);
    return set;
  }

  /// Returns a set containing all distinct elements from both collections.
  Set<T> union(Iterable<T> other) {
    final set = toSet();
    set.addAll(other);
    return set;
  }

  /// Performs the given action on each element on iterable, providing sequential index with the element.
  /// [element] the element on the current iteration
  /// [index] the index of the current iteration
  ///
  /// example:
  /// ["ss","tt","xx"].forEachIndexed((it, index) {
  ///    print("it, $index");
  ///  });
  /// result:
  /// ss, 0
  /// tt, 1
  /// xx, 2
  void forEachIndexed(void action(T element, int index)) {
    var index = 0;
    for (var element in this) {
      action(element, index++);
    }
  }

  /// Groups elements of the original collection by the key returned by the given [keySelector] function
  /// applied to each element and returns a map where each group key is associated with a list of corresponding elements.
  ///
  /// The returned map preserves the entry iteration order of the keys produced from the original collection.
  Map<K, List<T>> groupBy<T, K>(K keySelector(T e)) {
    var map = <K, List<T>>{};

    for (final element in this) {
      var list = map.putIfAbsent(keySelector(element as T), () => []);
      list.add(element as T);
    }
    return map;
  }

  /// Returns a list containing only elements matching the given [predicate]
  List<T> filter(bool test(T element)) {
    final result = <T>[];
    forEach((e) {
      if (test(e)) {
        result.add(e);
      }
    });
    return result;
  }

  /// Returns a list containing all elements not matching the given [predicate]
  List<T> filterNot(bool test(T element)) {
    final result = <T>[];
    forEach((e) {
      if (!test(e)) {
        result.add(e);
      }
    });
    return result;
  }

  /// Returns a list containing all elements that are not null
  List<T> filterNotNull() {
    final result = <T>[];
    forEach((e) {
      if (e != null) {
        result.add(e);
      }
    });
    return result;
  }

  /// Returns a list containing first [n] elements.
  List<T> take(int n) {
    if (n <= 0) return [];

    var list = List<T>();
    if (this is Iterable) {
      if (n >= this.length) return this.toList();

      var count = 0;
      var thisList = this.toList();
      for (var item in thisList) {
        list.add(item);
        if (++count == n)
          break;
      }
    }
    return list;
  }

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
