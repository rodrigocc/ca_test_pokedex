import 'package:ca_test_pokedex/features/home/interactor/entities/pokemon.dart';

class PokemonListState {
  final bool isLoading;
  final List<Pokemon> pokemons;
  final String? error;
  final int id;

  PokemonListState(
      {required this.isLoading,
      required this.pokemons,
      this.error,
      required this.id});

  PokemonListState copyWith(
      {bool? isLoading, List<Pokemon>? pokemons, String? error, int? id}) {
    return PokemonListState(
        isLoading: isLoading ?? this.isLoading,
        pokemons: pokemons ?? this.pokemons,
        error: error ?? this.error,
        id: id ?? this.id);
  }

  factory PokemonListState.initial() {
    return PokemonListState(isLoading: false, pokemons: [], error: null, id: 0);
  }
}
