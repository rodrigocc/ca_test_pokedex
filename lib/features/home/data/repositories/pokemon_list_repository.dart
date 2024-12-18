import 'dart:convert';
import 'dart:developer';
import 'package:ca_test_pokedex/features/home/data/models/pokemon_model.dart';
import 'package:ca_test_pokedex/http_adapter/http_adapter.dart';
import 'package:dio/dio.dart';

abstract class PokemonListRepository {
  Future<List<PokemonModel>> fetchPokemonList();
}

class PokemonListRepositoryImpl implements PokemonListRepository {
  final HttpAdapter client;

  PokemonListRepositoryImpl({required this.client});

  @override
  Future<List<PokemonModel>> fetchPokemonList() async {
    try {
      final response = await client.apitRequest(
        apitMethod: HttpMethod.get,
        path: 'pokemon?limit=20',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        // log(data); // Dio já decodifica JSON automaticamente.
        return (data['results'] as List)
            .map((item) => PokemonModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to fetch Pokémon list');
      }
    } catch (e) {
      throw Exception('Error fetching Pokémon list: $e');
    }
  }
}
