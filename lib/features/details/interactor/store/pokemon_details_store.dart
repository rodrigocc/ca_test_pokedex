import 'package:ca_test_pokedex/features/details/interactor/entities/pokemon_details.dart';
import 'package:ca_test_pokedex/features/details/interactor/usecases/pokemon_details_usecase.dart';
import 'package:flutter/foundation.dart';

class PokemonDetailsStore extends ValueNotifier<PokemonDetails?> {
  final FetchPokemonDetailsUseCase fetchPokemonDetailsUseCase;

  PokemonDetailsStore({required this.fetchPokemonDetailsUseCase}) : super(null);

  Future<void> loadPokemonDetails(int id) async {
    try {
      value = await fetchPokemonDetailsUseCase.call(id);
    } catch (e) {
      throw Exception('Error loading details');
    }
  }
}
