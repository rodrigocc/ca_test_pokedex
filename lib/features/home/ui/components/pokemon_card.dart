import 'package:ca_test_pokedex/features/details/interactor/store/pokemon_details_store.dart';
import 'package:ca_test_pokedex/features/details/ui/pokemon_details_page.dart';
import 'package:ca_test_pokedex/features/home/interactor/entities/pokemon.dart';
import 'package:ca_test_pokedex/features/home/interactor/stores/pokemon_list_store.dart';
import 'package:ca_test_pokedex/theme/pokemon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  final store = Modular.get<PokemonListStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(32)),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Image.asset("assets/images/pokeball.png",
                  height: 110, width: 110),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${store.value.id}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            widget.pokemon.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: getPokemonType([]),
                          ),
                        ],
                      ),
                      Hero(
                        tag: '${store.value.id}',
                        child: Image.network(
                          '',
                          height: 100,
                          width: 100,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('Image not Loaded');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PokemonDetailsPage(pokemonid: store.value.id)));
      },
    );
  }

  List<Image> getPokemonType(List<dynamic> type) {
    List<Image> iconType = [];
    int index;
    for (index = 0; index < type.length; index++) {
      if (type[index] == 'Fire') {
        iconType.add(Image.asset(PokemonIcons.fire));
      } else if (type[index] == "Grass") {
        iconType.add(Image.asset(PokemonIcons.grass));
      } else if (type[index] == "Poison") {
        iconType.add(Image.asset(PokemonIcons.poison));
      } else if (type[index] == "Ice") {
        iconType.add(Image.asset(PokemonIcons.ice));
      } else if (type[index] == "Flying") {
        iconType.add(Image.asset(PokemonIcons.flying));
      } else if (type[index] == "Water") {
        iconType.add(Image.asset(PokemonIcons.water));
      } else if (type[index] == "Ground") {
        iconType.add(Image.asset(PokemonIcons.ground));
      } else if (type[index] == "Rock") {
        iconType.add(Image.asset(PokemonIcons.rock));
      } else if (type[index] == "Electric") {
        iconType.add(Image.asset(PokemonIcons.eletric));
      } else if (type[index] == "Normal") {
        iconType.add(Image.asset(PokemonIcons.normal));
      } else if (type[index] == "Fighting") {
        iconType.add(Image.asset(PokemonIcons.fighting));
      } else if (type[index] == "Bug") {
        iconType.add(Image.asset(PokemonIcons.bug));
      } else if (type[index] == "Psychic") {
        iconType.add(Image.asset(PokemonIcons.psychic));
      } else if (type[index] == "Fairy") {
        iconType.add(Image.asset(PokemonIcons.fairy));
      } else if (type[index] == "Dragon") {
        iconType.add(Image.asset(PokemonIcons.dragon));
      }
    }
    return iconType;
  }
}
