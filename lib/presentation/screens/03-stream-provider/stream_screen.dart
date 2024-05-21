import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ranomdNames$ = ref.watch(namesStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: ranomdNames$.when(
          data: (name) => Center(
            child: Text(name),
          ),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),),
    );
  }
}
