import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/player_card.dart';

class PlayerCards extends StatefulWidget {
  Function(int) callback;

  PlayerCards(this.callback);

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
            GestureDetector(onTap: () => { this.widget.callback(0) }, child: PlayerCardWidget(number: 0)),
            GestureDetector(onTap: () => { this.widget.callback(1) }, child: PlayerCardWidget(number: 1)),
            GestureDetector(onTap: () => { this.widget.callback(2) }, child: PlayerCardWidget(number: 2)),
            GestureDetector(onTap: () => { this.widget.callback(3) }, child: PlayerCardWidget(number: 3)),
            GestureDetector(onTap: () => { this.widget.callback(5) }, child: PlayerCardWidget(number: 5)),
            GestureDetector(onTap: () => { this.widget.callback(8) }, child: PlayerCardWidget(number: 8)),
            GestureDetector(onTap: () => { this.widget.callback(13) }, child: PlayerCardWidget(number: 13)),
            GestureDetector(onTap: () => { this.widget.callback(20) }, child: PlayerCardWidget(number: 20)),
            GestureDetector(onTap: () => { this.widget.callback(40) }, child: PlayerCardWidget(number: 40)),
            GestureDetector(onTap: () => { this.widget.callback(100) }, child: PlayerCardWidget(number: 100)),
          ],
        ),
      ),
    );
  }
}
