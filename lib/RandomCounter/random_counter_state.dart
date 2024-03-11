import 'dart:math';

class RandomCounterState {
  late int _currentNumber = 0;
  final Random _rng = Random();

  int get currentValue => _currentNumber;

  RandomCounterState init() {
    return RandomCounterState().._currentNumber = 0;
  }

  RandomCounterState increment(RandomCounterState currentState) {
    return RandomCounterState()
      .._currentNumber = currentState.currentValue
      .._currentNumber += _rng.nextInt(101 - currentState.currentValue);
  }

  RandomCounterState decrement(RandomCounterState currentState) {
    return RandomCounterState()
      .._currentNumber = currentState.currentValue
      .._currentNumber -= _rng.nextInt(currentValue + 1);
  }
}
