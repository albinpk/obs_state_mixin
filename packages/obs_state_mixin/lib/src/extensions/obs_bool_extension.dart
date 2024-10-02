import '../obs.dart';

/// Extensions for [Obs]s of type [bool].
extension ObsBoolExtension on Obs<bool> {
  /// Toggles the value of the [Obs].
  ///
  /// If the value of the [Obs] is currently `true`, sets it to `false`.
  /// If the value of the [Obs] is currently `false`, sets it to `true`.
  void toggle() => value = !value;

  /// Sets the value of the [Obs] to `true`.
  void setTrue() => value = true;

  /// Sets the value of the [Obs] to `false`.
  void setFalse() => value = false;
}
