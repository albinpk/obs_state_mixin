import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obs_state_mixin/obs_state_mixin.dart';

void main() {
  testWidgets('obs updates', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: _TestWidget()),
    );

    expect(find.text('0'), findsOne);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOne);
  });

  testWidgets('obs auto dispose', (tester) async {
    late Obs<int> obs;

    await tester.pumpWidget(
      MaterialApp(
        home: _AutoDisposeTestWidget(
          getObs: (Obs<int> value) {
            obs = value;
          },
        ),
      ),
    );

    expect(obs.value, 0);

    // disposing the previous widget, it also disposes the obs
    await tester.pumpWidget(const SizedBox());

    // updating the obs value will throw, since the widget has been disposed
    expect(() => obs.value++, throwsFlutterError);
  });

  testWidgets('onDispose method', (tester) async {
    int count1 = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: _AutoDisposeTestWidget(
          getOnDispose: (onDispose) {
            onDispose(() => count1++);
            onDispose(() => count1++);
          },
        ),
      ),
    );

    expect(count1, 0);

    // disposing the previous widget, it also disposes the obs
    await tester.pumpWidget(const SizedBox());

    expect(count1, 2);
  });
}

class _TestWidget extends StatefulWidget {
  const _TestWidget();

  @override
  State<_TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> with ObsStateMixin {
  late final counter = obs(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('$counter'),
          IconButton(
            onPressed: () => counter.value++,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _AutoDisposeTestWidget extends StatefulWidget {
  const _AutoDisposeTestWidget({
    this.getObs,
    this.getOnDispose,
  });

  final void Function(Obs<int> obs)? getObs;
  final void Function(void Function(VoidCallback fn) onDispose)? getOnDispose;

  @override
  State<_AutoDisposeTestWidget> createState() => _AutoDisposeTestWidgetState();
}

class _AutoDisposeTestWidgetState extends State<_AutoDisposeTestWidget>
    with ObsStateMixin {
  late final counter = obs(0);

  @override
  void initState() {
    super.initState();
    widget.getObs?.call(counter);
    widget.getOnDispose?.call(onDispose);
  }

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}
