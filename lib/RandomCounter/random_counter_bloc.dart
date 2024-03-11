import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc Package

import 'random_counter_event.dart'; // My Event
import 'random_counter_state.dart'; // My State

class RandomCounterBloc extends Bloc<RandomCounterEvent, RandomCounterState> {
  RandomCounterBloc() : super(RandomCounterState()..init()) {
    on<RandomIncrementEvent>(
        (event, emit) => emit(state.increment(state))); // On Increment
    on<RandomDecrementEvent>(
        (event, emit) => emit(state.decrement(state))); // On Decrement
  }
}
