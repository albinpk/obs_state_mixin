import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'obs.dart';

/// A mixin to make it easier to use [Obs] with Flutter's [State].
///
/// See [State] for information on how to use this mixin.
mixin ObsStateMixin<T extends StatefulWidget> on State<T> {
  final _disposers = <VoidCallback>[];

  /// Disposes the [VoidCallback].
  ///
  /// Add the [VoidCallback] to the list of callbacks to be executed when
  /// [dispose] is called.
  void _addToDisposers(VoidCallback fn) => _disposers.add(fn);

  /// Creates a new [Obs] and listens to it.
  ///
  /// When the [Obs] is updated, calls [setState] on the [State].
  @nonVirtual
  Obs<V> obs<V>(V value) {
    final notifier = Obs<V>(value)..addListener(() => setState(() {}));
    _addToDisposers(notifier.dispose);
    return notifier;
  }

  @override
  void dispose() {
    for (final fn in _disposers) {
      fn();
    }
    super.dispose();
  }
}
