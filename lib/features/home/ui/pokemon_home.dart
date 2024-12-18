// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ca_test_pokedex/features/home/interactor/states/pokemon_list_state.dart';
import 'package:ca_test_pokedex/features/home/interactor/stores/pokemon_list_store.dart';
import 'package:ca_test_pokedex/features/home/ui/components/pokemon_card.dart';
import 'package:flutter/material.dart';

class PokemonHomePage extends StatefulWidget {
  final PokemonListStore pokemonListStore;

  const PokemonHomePage({
    super.key,
    required this.pokemonListStore,
  });

  @override
  _PokemonHomePageState createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  @override
  void initState() {
    super.initState();

    widget.pokemonListStore.loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<PokemonListState>(
      valueListenable: widget.pokemonListStore,
      builder: (_, state, child) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemBuilder: (_, index) {
                final pokemon = widget.pokemonListStore.value.pokemons[index];
                return PokemonCard(
                  pokemon: pokemon,
                );
              },
              itemCount: widget.pokemonListStore.value.pokemons.length,
            ));
      },
    ));
  }
}
