import 'package:flutter/material.dart';

class HomeTemplate extends StatefulWidget {
  final Widget child;

  HomeTemplate({this.child});

  @override
  State<StatefulWidget> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  double heightS;
  double widthS;

  @override
  Widget build(BuildContext context) {
    heightS = MediaQuery.of(context).size.height;
    widthS = MediaQuery.of(context).size.width;

    return Container(
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
        child: widget.child);
  }
}
