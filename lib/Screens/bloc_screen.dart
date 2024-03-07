import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Blocs/bloc_counter_bloc.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Views/bloc_counter_view.dart';

/// The Provider Screen
class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCounterBloc(),
      child: BlocCounterView(),
      // appBar: AppBar(title: const Text('Bloc Screen')),
      // body: const Center(
      //   child: Text('This is the Bloc Screen'),
      // ),
    );
  }
}
