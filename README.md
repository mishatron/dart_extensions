# dart_extensions

Extensions for different types similar to kotlin

## Available classes and their usage

Added class Pair like in other languages
```
Pair<int, String> pair = Pair();
```

## Available method and their usage

`listOf` - To create list from Iterable
`repeat` - Executes the given function action specified number of times.<br/>
`run` - Calls the specified function operation with `this` value as its receiver and returns its result.<br/>
`let` - Calls the specified function operation with `this` value as its argument and returns its result.<br/>
`also` - Calls the specified function operation with `this` value as its argument and returns `this` value.<br/>

### String extensions

`isNullOrEmpty` - Returns `true` if this nullable char sequence is either `null` or empty.<br/>
`isNotNullOrEmpty` - Returns `false` if this nullable char sequence is either `null` or empty.<br/>
`reversed` - Returns a progression that goes over the same range in the opposite direction with the same step.<br/>
`toInt` - Returns the value of this number as an int.<br/>
`toIntOrNull` - Returns the value of this number as an int or null if can not be parsed.<br/>
`toDouble` - Returns the value of this number as an double.<br/>
`toDoubleOrNull` - Returns the value of this number as an double or null if can not be parsed.<br/>
`toBoolean` - Returns true if 'this' is "true", otherwise - false.<br/>
`replaceAfter` - Replaces part of string after the first occurrence of given delimiter with the replacement string.<br/>
`replaceBefore` - Replaces part of string before the first occurrence of given delimiter with the replacement string.<br/>
`anyChar` - Returns `true` if at least one element matches the given predicate.<br/>

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

### List extensions

`distinctBy` - Returns a list containing only elements from the given collection having distinct keys returned by the given selector function.
