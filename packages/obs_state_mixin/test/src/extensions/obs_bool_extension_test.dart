import 'package:flutter_test/flutter_test.dart';
import 'package:obs_state_mixin/obs_state_mixin.dart';

void main() {
  group('Obs<bool> extension', () {
    late Obs<bool> obs;
    setUp(() => obs = Obs<bool>(false));
    tearDown(() => obs.dispose());

    test('toggle method', () {
      expect(obs.value, false);
      obs.toggle();
      expect(obs.value, true);
      obs.toggle();
      expect(obs.value, false);
    });

    test('setTrue method', () {
      expect(obs.value, false);
      obs.setTrue();
      expect(obs.value, true);
      obs.setTrue();
      expect(obs.value, true);
    });

    test('setFalse method', () {
      obs.value = true;
      obs.setFalse();
      expect(obs.value, false);
      obs.setFalse();
      expect(obs.value, false);
    });
  });
}
