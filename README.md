# dart_extensions

Extensions for different types similar to kotlin

## Available classes and their usage

Added class Pair like in other languages
```
Pair<int, String> pair = Pair();
```

## Available method and their usage

`listOf` - To create list from Iterable
`repeat` - Executes the given function action specified number of times.  
`run` - Calls the specified function operation with `this` value as its receiver and returns its result.  
`let` - Calls the specified function operation with `this` value as its argument and returns its result.  
`also` - Calls the specified function operation with `this` value as its argument and returns `this` value.

### String extensions

`isNullOrEmpty` - Returns `true` if this nullable char sequence is either `null` or empty.  
`isNotNullOrEmpty` - Returns `false` if this nullable char sequence is either `null` or empty.  
`reversed` - Returns a progression that goes over the same range in the opposite direction with the same step.  
`toInt` - Returns the value of this number as an int.  
`toIntOrNull` - Returns the value of this number as an int or null if can not be parsed.  
`toDouble` - Returns the value of this number as an double.  
`toDoubleOrNull` - Returns the value of this number as an double or null if can not be parsed.  
`toBoolean` - Returns true if 'this' is "true", otherwise - false.  
`replaceAfter` - Replaces part of string after the first occurrence of given delimiter with the replacement string.  
`replaceBefore` - Replaces part of string before the first occurrence of given delimiter with the replacement string.  
`anyChar` - Returns `true` if at least one element matches the given predicate.  
`containsIgnoreCase` - Returns `true` if string contains another without matching case.

### Bool extension

`not` - Returns the inverse of this boolean.  
`and` - Logical and.  
`or` - Logical or.  
`xor` - Logical xor.

### Iterable extensions

`isNullOrEmpty` - Returns `true` if this nullable iterable is either `null` or empty.  
`isNotNullOrEmpty` - Returns `false` if this nullable iterable is either `null` or empty.  
`any` - Returns `true` if at least one element matches the given predicate.  
`toSet` - Convert iterable to set.  
`intersect` - Returns a set containing all elements that are contained by both this set and the specified collection.  
`subtract` - Returns a set containing all elements that are contained  by this collection and not contained by the specified collection.  
`union` - Returns a set containing all distinct elements from both collections.  
`countWhere` - Returns count of elements that matches the given predicate.

### List extensions

`distinctBy` - Returns a list containing only elements from the given collection having distinct keys returned by the given selector function.
