import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/screen/index.dart';
import 'package:pokedex/service/service.dart';
import 'package:pokedex/utils/Utils.dart';
import 'package:pokedex/widget/index.dart';

class HomePokemonPage extends StatefulWidget {
  @override
  _HomePokemonPageState createState() => _HomePokemonPageState();
}

class _HomePokemonPageState extends State<HomePokemonPage> {
  PokemonProvider _pokemonProvider = PokemonProvider();
  int countPokemon;

  Widget cardGridView(int index) {
    String imgURL = Utils.frontPokemon(index);
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(9, 8),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutPokemon(idPokemon: index),
              ),
            );
          },
          onLongPress: () {
            dialogStatus(index);
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: imgURL,
                    image: imgURL,
                    width: 70,
                    height: 70,
                  ),
                  Text(
                    "$index",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showAllCardPokemon() {
    return GridView.builder(
        itemCount: 808,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 8.0 / 10.0,
          crossAxisCount: 3,
        ),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                "Select a pokemon",
                textAlign: TextAlign.center,
              ),
            );
          }
          return cardGridView(index);
        });
  }

  Future dialogStatus(int idPokemon) async {
    Pokemon poke = await _pokemonProvider.getOnePokemonStatus(idPokemon);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Image.network(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$idPokemon.png",
              width: 70,
              height: 70,
            ),
            content: Container(
              height: 80,
              width: 100,
              child: Center(
                heightFactor: 100,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${poke.name}\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Height: ",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("${poke.height * 10}cm"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Weight: ",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("${poke.weight / 10}kg"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
      ),
      body: HomeTemplate(
        child: Container(
          child: showAllCardPokemon(),
        ),
      ),
    );
  }

  void initRequests() async {
    countPokemon = await PokemonProvider().getAllPokemonNumber();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initRequests();
  }
}
