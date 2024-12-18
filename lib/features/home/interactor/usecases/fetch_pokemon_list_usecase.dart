// lib/modules/home/domain/usecases/fetch_pokemon_list_usecase.dart
import 'package:ca_test_pokedex/features/home/data/repositories/pokemon_list_repository.dart';

import '../entities/pokemon.dart';

class FetchPokemonListUseCase {
  final PokemonListRepository repository;

  FetchPokemonListUseCase({required this.repository});

  Future<List<Pokemon>> call() async {
    final models = await repository.fetchPokemonList();
    return models
        .map((model) => Pokemon(name: model.name, url: model.url))
        .toList();
  }
}
