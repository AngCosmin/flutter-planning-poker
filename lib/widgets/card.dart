import 'package:flutter/material.dart';

import 'package:flutterpoker/extensions/hover_extensions.dart';

class CardWidget extends StatelessWidget {
  final int number;
  final double width;
  final double height;

  const CardWidget({Key key, this.number, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;
    double cardWidth = 0;
    double cardHeight = 0;

    if (windowWidth > 960) {
      cardWidth = 100;
    } else {
      cardWidth = 75;
    }

    cardHeight = cardWidth * 1.35;

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                blurRadius: 3,
                spreadRadius: 1
            )
          ]
      ),
      height: cardHeight,
      width: cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'resources/images/card_${this.number}.png',
          fit: BoxFit.cover,
        ),
      ),
    ).showCursorOnHover;
  }
}
