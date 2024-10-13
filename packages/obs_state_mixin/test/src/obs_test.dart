import 'package:flutter_test/flutter_test.dart';
import 'package:obs_state_mixin/obs_state_mixin.dart';

void main() {
  group('Obs class', () {
    late Obs<int> obs;
    setUp(() => obs = Obs<int>(0));
    tearDown(() => obs.dispose());

    test('setValue method', () {
      obs.setValue(1);
      expect(obs.value, 1);
      obs.setValue(-1);
      expect(obs.value, -1);
    });

    test('refresh method', () {
      int calls = 0;
      obs.addListener(() => calls++);

      obs.refresh();
      obs.refresh();

      expect(calls, 2);
    });

    test('toString method', () {
      expect(obs.toString(), obs.value.toString());
    });
  });
}
