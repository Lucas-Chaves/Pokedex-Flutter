import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/service/service.dart';
import 'package:pokedex/utils/Utils.dart';
import 'package:pokedex/widget/index.dart';

class AboutPokemon extends StatefulWidget {
  final int idPokemon;

  const AboutPokemon({@required this.idPokemon});

  @override
  _AboutPokemonState createState() => _AboutPokemonState();
}

class _AboutPokemonState extends State<AboutPokemon> {
  Pokemon _pokemon = Pokemon.initial();

  Widget showMove() {
    return GridView.builder(
        itemCount: _pokemon.pokemonMoves.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 65 / 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          String movePokemon =
              Utils.capitalize(_pokemon.pokemonMoves[index].name);
          return Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$movePokemon",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        });
  }

  Widget showType() {
    return GridView.builder(
        itemCount: _pokemon.pokemonType.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          String typePokemon =
              Utils.capitalize(_pokemon.pokemonType[index].name);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Type: ",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text("$typePokemon"),
            ],
          );
        });
  }

  Widget showAboutPokemon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Height: ", style: TextStyle(fontWeight: FontWeight.w800)),
                Text("${_pokemon.height * 10} cm"),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Height: ", style: TextStyle(fontWeight: FontWeight.w800)),
                Text("${_pokemon.weight / 10} Kg"),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Base experience: ", style: TextStyle(fontWeight: FontWeight.w800)),
              Text("${_pokemon.baseExperience.toString()} Exp"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String urlImage = Utils.frontPokemon(widget.idPokemon);

    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.capitalize(_pokemon.name)),
        centerTitle: true,
      ),
      body: HomeTemplate(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: urlImage,
                  image: urlImage,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 100,
                  child: showType(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 100,
                  child: showAboutPokemon(),
                ),
                ExpansionTile(
                  title: Text(
                    "Moves",
                    textAlign: TextAlign.center,
                  ),
                  initiallyExpanded: false,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        setState(() {

                        });
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: showMove()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    _pokemon = await PokemonProvider().getOnePokemonStatus(widget.idPokemon);
    setState(() {});
    super.didChangeDependencies();
  }
}
