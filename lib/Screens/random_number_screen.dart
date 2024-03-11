import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// RandomCounter Things
import '/RandomCounter/random_counter_bloc.dart';
import '/RandomCounter/random_counter_event.dart';
import '/RandomCounter/random_counter_state.dart';

class RandomCounterScreen extends StatelessWidget {
  const RandomCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocListener<RandomCounterBloc, RandomCounterState>(
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
              child: BlocBuilder<RandomCounterBloc, RandomCounterState>(
                builder: (context, state) => Text('${state.currentValue}'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<RandomCounterBloc>()
                        .add(RandomIncrementEvent());
                  },
                  heroTag: 'incrementBtn',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<RandomCounterBloc>()
                        .add(RandomDecrementEvent());
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
