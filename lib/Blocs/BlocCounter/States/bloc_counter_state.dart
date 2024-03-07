class BlocCounterState {
  late int _currentNumber = 0;

  int get currentValue => _currentNumber;

  BlocCounterState init() {
    return BlocCounterState().._currentNumber = 0;
  }

  BlocCounterState increment(BlocCounterState currentState) {
    return BlocCounterState()
      .._currentNumber = currentState.currentValue
      .._currentNumber += 1;
  }

  BlocCounterState decrement(BlocCounterState currentState) {
    return BlocCounterState()
      .._currentNumber = currentState.currentValue
      .._currentNumber = _currentNumber == 0 ? 0 : _currentNumber -= 1;
  }
}
