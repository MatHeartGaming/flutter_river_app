import 'package:flutter/material.dart';

class StateProviderScreen extends StatelessWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
      body: Center(
        child: Text('Mat Buompy', style: titleStyle.titleMedium,),
      ),
    );
  }
}
