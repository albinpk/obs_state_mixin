import 'package:flutter_test/flutter_test.dart';
import 'package:obs_state_mixin/obs_state_mixin.dart';

void main() {
  group('Obs class', () {
    late Obs<int> obs;
    setUp(() => obs = Obs<int>(0));
    tearDown(() => obs.dispose());

    test('refresh method', () {
      int calls = 0;
      obs.addListener(() => calls++);

      obs.refresh();
      obs.refresh();

      expect(calls, 2);
    });
  });
}
