import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_thingy/BlocCounter/bloc_counter_bloc.dart';
import 'package:navigation_thingy/RandomCounter/random_counter_bloc.dart';
import 'package:navigation_thingy/Widgets/burger_menu_widget.dart';

// Screens
import 'Screens/bloc_counter_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/provider_screen.dart';
import 'Screens/random_number_screen.dart';

void main() {
  runApp(const MyApp());
}

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: RootScreen(child: child)),
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
                builder: (BuildContext context, GoRouterState state) =>
                    BlocProvider(
                      create: (context) => BlocCounterBloc(),
                      child: const BlocCounterScreen(),
                    )
                ),
            GoRoute(
              path: 'random',
              builder: (BuildContext context, GoRouterState state) {
                return BlocProvider(
                  create: (context) => RandomCounterBloc(),
                  child: const RandomCounterScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class RootScreen extends StatelessWidget {
  final Widget child;

  const RootScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      appBar: AppBar(
        title: const Text('Navigator Thingy'),
      ),
      drawer: const BurgerMenuWidget(),
    );
  }
}
