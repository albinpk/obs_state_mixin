import 'package:flutter/foundation.dart';

/// A class to hold a value and notify listeners when the value changes.
///
/// See also:
///
/// * [ValueNotifier], the class that [Obs] is based on.
class Obs<T> extends ValueNotifier<T> {
  /// Creates a new [Obs] with the given [value].
  Obs(super.value);

  /// Notifies listeners that the value has changed.
  void refresh() => notifyListeners();

  /// A string representation of the [Obs].
  @override
  String toString() => value.toString();
}
