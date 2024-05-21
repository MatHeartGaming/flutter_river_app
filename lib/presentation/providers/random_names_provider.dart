import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  await for (final name in RandomGenerator.getRandomNamesStream()) {
    yield name;
  }
});

/*final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
  Future.delayed(const Duration(seconds: 2));
  yield [];
  await Future.delayed(const Duration(seconds: 1));
  yield ['Fernando'];
  await Future.delayed(const Duration(seconds: 1));
  yield ['Fernando', 'Matteo'];
  await Future.delayed(const Duration(seconds: 1));
  yield ['Fernando', 'Matteo', 'Serena'];
});*/
