import 'package:flutter/foundation.dart';

/// A class to hold a value and notify listeners when the value changes.
///
/// See also:
///
/// * [ValueNotifier], the class that [Obs] is based on.
class Obs<T> extends ValueNotifier<T> {
  /// Creates a new [Obs] with the given [value].
  Obs(super.value);

  /// Sets the [value] of the [Obs] to [newValue].
  ///
  /// ```dart
  /// final count = Obs(0);
  /// count.setValue(1); // Same as count.value = 1;
  /// ```
  ///
  /// This is useful when you want to update the value of the [Obs] in a callback,
  /// such as when responding to user input in a [TextField].
  ///
  /// eg.
  ///
  /// ```dart
  /// final userName = obs('');
  ///
  /// // Using callback
  /// TextField(
  ///   onChanged: (input) {
  ///     userName.value = input;
  ///   },
  /// );
  ///
  /// // Using setValue method
  /// TextField(
  ///   onChanged: userName.setValue,
  /// );
  /// ```
  void setValue(T newValue) => value = newValue;

  /// Notifies listeners that the value has changed.
  void refresh() => notifyListeners();

  /// A string representation of the [Obs].
  @override
  String toString() => value.toString();
}
