import 'package:ca_test_pokedex/features/details/data/models/pokemon_details_model.dart';
import 'package:ca_test_pokedex/features/details/interactor/entities/pokemon_details.dart';
import 'package:ca_test_pokedex/http_adapter/http_adapter.dart';

abstract class PokemonDetailsRepository {
  Future<PokemonDetails> fetchPokemonDetails(int id);
}

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final HttpAdapter client;

  PokemonDetailsRepositoryImpl({required this.client});

  @override
  Future<PokemonDetails> fetchPokemonDetails(int id) async {
    final response = await client.apitRequest(
        apitMethod: HttpMethod.get, path: 'pokemon/$id');

    if (response.statusCode == 200) {
      return PokemonDetailsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
