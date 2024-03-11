import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// BlocCounter Things
import '/BlocCounter/bloc_counter_bloc.dart';
import '/BlocCounter/bloc_counter_event.dart';
import '/BlocCounter/bloc_counter_state.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

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
            BlocListener<BlocCounterBloc, BlocCounterState>(
              listener: (context, state) {
                if (state.currentValue % 3 == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text('Three!!!  ${state.currentValue}'),
                    ),
                  );
                }
              },
              child: BlocBuilder<BlocCounterBloc, BlocCounterState>(
                builder: (context, state) {
                  return Text('${state.currentValue}');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<BlocCounterBloc>()
                        .add(CounterIncrementEvent());
                  },
                  heroTag: 'incrementBtn',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<BlocCounterBloc>()
                        .add(CounterDecrementEvent());
                  },
                  heroTag: 'decrementBtn',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
