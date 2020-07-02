import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:pokedex/screen/menu/HomePokemons.dart';
import 'package:pokedex/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PackageInfo packageInfo;
  String version;
  String buildNumber;
  double heightS;
  double widthS;

  @override
  Widget build(BuildContext context) {
    heightS = MediaQuery.of(context).size.height;
    widthS = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
      ),
      body: Container(
        height: heightS,
        width: widthS,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: widthS * 0.04, vertical: heightS * 0.04),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background/background.png"),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            "Aplicação em flutter que exibe dados sobre um pokemon, mostrando o seus status e técnicas. ",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: "Para mais informações sobre API acesse o site ",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: " https://pokeapi.co/",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL();
                          },
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(
                        text:
                            "\n \n Para mais informações ou detalhes sobre o código você pode acessar o repositório no ",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: "GitHub",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL();
                          },
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
            buttonStart(),
            Container(
              alignment: Alignment.center,
              child: Text("v$version+$buildNumber"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonStart() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      hoverColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePokemonPage(),
          ),
        );
      },
      child: Container(
        width: widthS,
        child: Text(
          "Começar",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://pokeapi.co/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    setState(() {});
  }
}
