import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.spain);
    return randomNames.fullName();
  }

  static Stream<String> getRandomNamesStream({int milliseconds = 500}) {
    return Stream.periodic(
      Duration(milliseconds: milliseconds),
      (computationCount) {
        final newName = getRandomName();
        print("Stream new value: $newName");
        return newName;
      },
    );
  }
}
