class Moves {
  String name;
  String urlMove;

  Moves(this.name, this.urlMove);

  Moves.fromMap(Map map)
      : name = map["move"]["name"],
        urlMove = map["move"]["url"];



}
