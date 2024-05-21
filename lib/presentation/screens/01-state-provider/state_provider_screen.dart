import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(randomNameProvider);
    final titleStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: () {
          /*ref.read(randomNameProvider.notifier).update(
            (state) => state.toUpperCase(),
          );*/
          ref.invalidate(randomNameProvider);
        },
      ),
      body: Center(
        child: Text(
          name,
          style: titleStyle.titleMedium,
        ),
      ),
    );
  }
}
