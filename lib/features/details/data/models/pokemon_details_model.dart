import 'package:ca_test_pokedex/features/details/interactor/entities/pokemon_details.dart';
import 'package:flutter/material.dart';

class PokemonDetailsModel extends PokemonDetails {
  PokemonDetailsModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.types,
    required super.imageUrl,
    required super.stats,
  });

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color(0xffFFE0CA);
        {}
      case 'Fire':
        return const Color(0xffEC8C4C);
      case 'Water':
        return const Color(0xff20C5F5);
      case 'Grass':
        return const Color(0xff70D090);
      case 'Electric':
        return const Color(0xffFCF47C);

      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return const Color(0xffB8B8B8);

      case 'Poison':
        return const Color(0xffDDA1E7);

      case 'Ground':
        return const Color(0xff9E6E53);

      case 'Flying':
        return const Color(0xffA98DF8);
      case 'Psychic':
        return const Color(0xffA98DF8);

      case 'Bug':
        return const Color(0xffD0EC94);

      case 'Rock':
        return const Color(0xff9A8371);

      case 'Ghost':
        return const Color(0xffCDCDCD);

      case 'Dark':
        return const Color(0xff8D8ECB);

      case 'Dragon':
        return const Color(0xffB7DBFF);
      case 'Steel':
        return const Color(0xff7A95AA);

      case 'Fairy':
        return const Color(0xffFDB7DA);

      default:
        return Colors.grey;
    }
  }

  Color? get baseColor => _color(type: types[0]);

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      imageUrl: json['sprites']['front_default'],
      stats: {
        for (var stat in json['stats']) stat['stat']['name']: stat['base_stat'],
      },
    );
  }
}
