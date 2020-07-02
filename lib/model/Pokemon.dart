import 'model.dart';

class Pokemon {
  String name;
  int weight;
  int height;
  int baseExperience;
  List<Moves> pokemonMoves;
  List<TypePokemon> pokemonType;

  Pokemon(this.name, this.weight, this.height, this.baseExperience);

  Pokemon.fromMap(Map map)
      : name = map["name"],
        weight = map["weight"],
        height = map["height"],
        baseExperience = map["base_experience"],
        pokemonMoves = _fromListMoves(map["moves"]),
        pokemonType = _fromListType(map["types"]);

  static List<Moves> _fromListMoves(List<dynamic> maps) {
    List<Moves> pokemonMoves = maps.map((map) => Moves.fromMap(map)).toList();
    return pokemonMoves;
  }

  static List<TypePokemon> _fromListType(List<dynamic> maps) {
    List<TypePokemon> pokemonType =
        maps.map((map) => TypePokemon.fromMap(map)).toList();
    return pokemonType;
  }

  Pokemon.initial()
      : name = "",
        weight = 0,
        height = 0,
        baseExperience = 0,
        pokemonMoves = [],
        pokemonType = [];
}
