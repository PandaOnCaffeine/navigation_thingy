import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Blocs/bloc_counter_bloc.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Events/bloc_counter_event.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/States/bloc_counter_state.dart';

class BlocCounterView extends StatelessWidget {
  /// {@macro counter_page}
  const BlocCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCounterBloc(),
      child: const BlocCounterScreen(),
    );
  }
}

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<BlocCounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocListener<BlocCounterBloc, BlocCounterState>(
              listener: (context, state) {
                if (state.currentValue % 3 == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.purple,
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
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(CounterDecrementEvent());
                  },
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
