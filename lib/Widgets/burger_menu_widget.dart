import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BurgerMenuWidget extends StatelessWidget {
  const BurgerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 64.0,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 178, 65, 65)),
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(0.0),
              child: Text(
                'BurgerMenu:',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            title: const Text('Bloc'),
            onTap: () {
              // Go to Root
              context.go('/bloc');
            },
          ),
          ListTile(
            title: const Text('Provider'),
            onTap: () {
              // Go to Provider Route
              context.go('/provider');
            },
          ),
        ],
      ),
    );
  }
}
