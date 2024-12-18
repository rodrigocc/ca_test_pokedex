import 'package:ca_test_pokedex/features/home/interactor/states/pokemon_list_state.dart';
import 'package:ca_test_pokedex/features/home/interactor/usecases/fetch_pokemon_list_usecase.dart';
import 'package:flutter/foundation.dart';

class PokemonListStore extends ValueNotifier<PokemonListState> {
  final FetchPokemonListUseCase fetchPokemonListUseCase;

  PokemonListStore({required this.fetchPokemonListUseCase})
      : super(PokemonListState.initial());

  Future<void> loadPokemons() async {
    value = value.copyWith(isLoading: true, error: null);
    try {
      final pokemons = await fetchPokemonListUseCase.call();
      value = value.copyWith(isLoading: false, pokemons: pokemons);
    } catch (e) {
      value = value.copyWith(
          isLoading: false, error: 'Falha ao carregar lista de Pokemons');
    }
  }
}
