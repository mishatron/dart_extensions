# dart_extensions

Extensions for different types similar to kotlin

## Available classes and their usage

Added class Pair like in other languages
```
Pair<int, String> pair = Pair();
```

## Available method and their usage

`listOf` - To create list from Iterable
`repeat` - Executes the given function action specified number of times
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

### Bool extension

`not` - Returns the inverse of this boolean.

### Iterable extensions

`isNullOrEmpty` - Returns `true` if this nullable iterable is either `null` or empty.
`isNotNullOrEmpty` - Returns `false` if this nullable iterable is either `null` or empty.

### List extensions

`distinctBy` - Returns a list containing only elements from the given collection having distinct keys returned by the given selector function.