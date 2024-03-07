import 'package:flutter/material.dart';

/// The Provider Screen
class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Screen')),
      body: const Center(
        child: Text('This is the Provider Screen'),
      ),
    );
  }
}
