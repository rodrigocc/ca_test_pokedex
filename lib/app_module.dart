import 'package:ca_test_pokedex/features/details/data/repositories/pokemon_details_repository.dart';
import 'package:ca_test_pokedex/features/details/interactor/store/pokemon_details_store.dart';
import 'package:ca_test_pokedex/features/details/interactor/usecases/pokemon_details_usecase.dart';
import 'package:ca_test_pokedex/features/home/ui/pokemon_home.dart';

import 'features/home/data/repositories/pokemon_list_repository.dart';
import 'features/home/home_module.dart';
import 'features/home/interactor/stores/pokemon_list_store.dart';
import 'features/home/interactor/usecases/fetch_pokemon_list_usecase.dart';
import 'features/home/ui/home_page.dart';
import 'features/splash/splash_page.dart';
import 'http_adapter/http_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    //Client Http
    i.addSingleton<HttpAdapter>(HttpAdpaterImpl.new);

    //Home
    i.add<PokemonListStore>(PokemonListStore.new);
    i.add<PokemonListRepository>(PokemonListRepositoryImpl.new);
    i.add<FetchPokemonListUseCase>(FetchPokemonListUseCase.new);

    //Details
    i.add<PokemonDetailsStore>(PokemonDetailsStore.new);
    i.add<PokemonDetailsRepository>(PokemonDetailsRepositoryImpl.new);
    i.add<FetchPokemonDetailsUseCase>(FetchPokemonDetailsUseCase.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const SplashPage());

    r.child(
      '/home',
      child: (_) => PokemonHomePage(
        pokemonListStore: Modular.get<PokemonListStore>(),
      ),
    );
  }
}
