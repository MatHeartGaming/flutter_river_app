import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemonName(int id) async {
    final dio = Dio();
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');
      return response.data['name'] ?? 'name not found';
    } catch (e) {
      throw Exception('Pokemon not found: $e');
    }
  }
}
