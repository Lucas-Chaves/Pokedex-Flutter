class TypePokemon {
  String name;
  String url;

  TypePokemon(this.name, this.url);

  TypePokemon.fromMap(Map map)
      : name = map["type"]["name"],
        url = map["type"]["url"];
}
