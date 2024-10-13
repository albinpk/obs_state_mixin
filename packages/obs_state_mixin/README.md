# obs_state_mixin

[![deploy](https://github.com/albinpk/obs_state_mixin/actions/workflows/deploy.yml/badge.svg)](https://github.com/albinpk/obs_state_mixin/actions/workflows/deploy.yml)
[![codecov](https://codecov.io/github/albinpk/obs_state_mixin/graph/badge.svg?token=6OY333UOTH)](https://codecov.io/github/albinpk/obs_state_mixin)
[![Pub Version](https://img.shields.io/pub/v/obs_state_mixin)](https://pub.dev/packages/obs_state_mixin)
[![GitHub License](https://img.shields.io/github/license/albinpk/obs_state_mixin)](https://github.com/albinpk/obs_state_mixin/blob/dev/LICENSE)
![GitHub last commit](https://img.shields.io/github/last-commit/albinpk/obs_state_mixin)
[![Pub Points](https://img.shields.io/pub/points/obs_state_mixin)](https://pub.dev/packages/obs_state_mixin/score)

**obs_state_mixin** is a lightweight Flutter package for reactive state management. It provides an Obs class for observable values and `ObsStateMixin` to simplify automatic UI updates and resource cleanup in `StatefulWidget`.

## Features

- Create observable field with `ObsStateMixin`.
- Automatically listen to state changes and trigger `setState()`.
- Automatically dispose the observable when the widget is disposed.

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  obs_state_mixin: ^0.0.1-dev.6
```

Run `flutter pub get` to fetch the package.

## Usage

```dart
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with ObsStateMixin {
  // Creates a new observable called _counter.
  // This will automatically be disposed when the widget is disposed.
  late final _counter = obs(0);

  // Increments the value of _counter. No need to call setState().
  void _incrementCounter() => _counter.value++;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```
