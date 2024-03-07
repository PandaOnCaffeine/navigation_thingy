import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc Package
import 'package:navigation_thingy/Blocs/BlocCounter/Events/bloc_counter_event.dart'; // My Event
import 'package:navigation_thingy/Blocs/BlocCounter/States/bloc_counter_state.dart'; // My State

class BlocCounterBloc extends Bloc<BlocCounterEvent, BlocCounterState> {
  BlocCounterBloc() : super(BlocCounterState()..init()) {
    on<CounterIncrementEvent>((event, emit) => emit(state.increment(state))); // On Increment
    on<CounterDecrementEvent>((event, emit) => emit(state.decrement(state))); // On Decrement
  }
}
