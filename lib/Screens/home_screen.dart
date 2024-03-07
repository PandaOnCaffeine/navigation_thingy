import 'package:flutter/material.dart';
import '../Widgets/burger_menu_widget.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      drawer: const BurgerMenuWidget(),
      body: const Center(
        child: Text('This is the HomeScreen'),
      ),
    );
  }
}
