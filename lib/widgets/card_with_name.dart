import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutterpoker/widgets/card.dart';
import 'package:flutterpoker/widgets/card_back.dart';

class CardWithNameWidget extends StatefulWidget {
  final int number;

  const CardWithNameWidget({Key key, this.number}) : super(key: key);

  @override
  _CardWithNameWidgetState createState() => _CardWithNameWidgetState();
}

class _CardWithNameWidgetState extends State<CardWithNameWidget> {
  double angle;
  bool _hovering = false;
  Matrix4 nonHoverTransform;
  Matrix4 hoverTransform;

  @override
  void initState() {
    super.initState();

    this.setState(() {
      angle = this._generateRandomAngle(5);
      nonHoverTransform = Matrix4.identity()..rotateZ(angle);
      hoverTransform = Matrix4.identity()..scale(1.2, 1.2, 1)..translate(-5, -5, -5);
    });
  }

  @override
  Widget build(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;
    double cardWidth = 0;
    double cardHeight = 0;

    if (windowWidth > 700) {
      cardWidth = 140;
    } else {
      cardWidth = 80;
    }

    cardHeight = cardWidth * 1.35;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedContainer(
        curve: Curves.easeInOutQuint,
        duration: Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: Column(
          children: [
            MouseRegion(
              onEnter: (e) => _mouseEnter(true),
              onExit: (e) => _mouseEnter(false),
              child: FlipCard(
                front: CardWidget(
                  number: this.widget.number,
                  width: cardWidth,
                  height: cardHeight,
                ),
                back: CardBackWidget(
                  width: cardWidth,
                  height: cardHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text("Cosmin"),
            )
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }

  double _generateRandomAngle(int max) {
    // Generate random number between -max...max
    var randomGenerator = Random();
    var positive = randomGenerator.nextBool();
    var randInt = randomGenerator.nextInt(max);
    var result = positive ? randInt : 0 - randInt;

    return result * pi / 180;
  }
}
