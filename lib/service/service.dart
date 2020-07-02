import 'package:dio/dio.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/service/SingletonDio.dart';
import 'package:pokedex/service/pokemon/pokemon.dart';

class PokemonProvider implements PokemonService {
  Dio _dio = SingletonDio().getEntityManagerFactory();

  @override
  Future<int> getAllPokemonNumber() async {
    try {
      final response = await _dio.get("/pokemon");
      final int count = response.data["count"];
      return count;
    } catch (e) {
      return e;
    }
  }

  @override
  Future<Pokemon> getOnePokemonStatus(int idPokemon) async{
    try {
      final response = await _dio.get("/pokemon/$idPokemon");
      final pokemon = Pokemon.fromMap(response.data);
      return pokemon;
    } catch (e) {
      return e;
    }
  }
}
