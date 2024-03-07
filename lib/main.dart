import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Blocs/bloc_counter_bloc.dart';
import 'package:navigation_thingy/Blocs/BlocCounter/Views/bloc_counter_view.dart';
import 'Screens/home_screen.dart';
import 'Screens/provider_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'provider',
          builder: (BuildContext context, GoRouterState state) {
            return const ProviderScreen();
          },
        ),
        GoRoute(
          path: 'bloc',
          builder: (BuildContext context, GoRouterState state) {
            return const BlocCounterScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocCounterBloc>(
          create: (BuildContext context) => BlocCounterBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
*/