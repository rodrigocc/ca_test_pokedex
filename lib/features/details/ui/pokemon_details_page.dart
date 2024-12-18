import 'package:ca_test_pokedex/features/details/interactor/store/pokemon_details_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_modular/flutter_modular.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int pokemonid;

  const PokemonDetailsPage({
    super.key,
    required this.pokemonid,
  });

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  final store = Modular.get<PokemonDetailsStore>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    store.loadPokemonDetails(widget.pokemonid); // 3 abas
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 8.0;
    return ValueListenableBuilder(
        valueListenable: store,
        builder: (context, details, _) {
          if (details == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.blue,
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 80),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(
                              height: 50), // Espaço entre imagem e texto
                          Text(
                            details.name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Adiciona o TabBar
                          TabBar(
                            controller: _tabController,
                            labelColor: Colors.black,
                            indicatorColor: Colors.redAccent,
                            tabs: const [
                              Tab(text: 'Detalhes'),
                              Tab(text: 'Estatísticas'),
                              Tab(text: 'Habilidades'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                // Conteúdo da aba "Detalhes"
                                _buildDetailsTab(),
                                // Conteúdo da aba "Estatísticas"
                                _buildStatsTab(),
                                // Conteúdo da aba "Habilidades"
                                _buildAbilitiesTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 100,
                  child: Hero(
                    tag: '${store.value?.id}',
                    child: Image.network(
                      details.imageUrl,
                      fit: BoxFit.contain,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildDetailsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Número: ${store.value?.id}'),
          const SizedBox(height: 8),
          // Text('Tipo: ${join(", ")}'),
          const SizedBox(height: 8),
          // Text('Peso: ${widget.pokemon.weight}'),
          const SizedBox(height: 8),
          // Text('Altura: ${widget.pokemon.height}'),
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    return Center(
      child: Text(
        'Aqui estarão as estatísticas do Pokémon.',
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildAbilitiesTab() {
    return Center(
      child: Text(
        'Aqui estarão as habilidades do Pokémon.',
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }
}
