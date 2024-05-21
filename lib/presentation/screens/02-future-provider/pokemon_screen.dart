import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonAsync = ref.watch(pokemonNameProvider);
    //final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon: $pokemonId'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update(
                    (state) => state + 1,
                  );
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              if (pokemonId <= 1) return;
              ref.read(pokemonIdProvider.notifier).update(
                    (state) => state - 1,
                  );
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
      body: Center(
        child: pokemonAsync.when(
            data: (name) => Text(name),
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
