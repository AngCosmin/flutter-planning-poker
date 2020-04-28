import 'package:flutter/material.dart';

class CardBackWidget extends StatelessWidget {
  const CardBackWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;
    double cardWidth = 0;
    double cardHeight = 0;

    if (windowWidth > 700) {
      cardWidth = 100;
    } else {
      cardWidth = 75;
    }

    cardHeight = cardWidth * 1.35;

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                blurRadius: 3,
                spreadRadius: 1
            )
          ]
      ),
      width: cardWidth,
      height: cardHeight,
    );
  }
}
