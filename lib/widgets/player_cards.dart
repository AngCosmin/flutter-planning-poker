import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/player_card.dart';

class PlayerCards extends StatefulWidget {
  @override
  _PlayerCardsState createState() => _PlayerCardsState();
}

class _PlayerCardsState extends State<PlayerCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              blurRadius: 3,
              spreadRadius: 1
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
        child: Wrap(
          runSpacing: -50,
          children: [
            PlayerCardWidget(number: 0),
            PlayerCardWidget(number: 1),
            PlayerCardWidget(number: 2),
            PlayerCardWidget(number: 3),
            PlayerCardWidget(number: 5),
            PlayerCardWidget(number: 8),
            PlayerCardWidget(number: 13),
            PlayerCardWidget(number: 20),
            PlayerCardWidget(number: 40),
            PlayerCardWidget(number: 100),
          ],
        ),
      ),
    );
  }
}
