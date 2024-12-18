import 'package:ca_test_pokedex/features/details/data/repositories/pokemon_details_repository.dart';
import 'package:ca_test_pokedex/features/details/interactor/entities/pokemon_details.dart';

class FetchPokemonDetailsUseCase {
  final PokemonDetailsRepository repository;

  FetchPokemonDetailsUseCase({required this.repository});

  Future<PokemonDetails> call(int id) {
    return repository.fetchPokemonDetails(id);
  }
}
