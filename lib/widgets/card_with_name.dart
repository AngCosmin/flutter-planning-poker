import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutterpoker/widgets/card.dart';
import 'package:flutterpoker/widgets/card_back.dart';

class CardWithNameWidget extends StatefulWidget {
  final String name;
  final int number;
  final bool showValue;

  const CardWithNameWidget({Key key, this.name, this.number, this.showValue }) : super(key: key);

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
      hoverTransform = Matrix4.identity()..scale(1.175, 1.175)..translate(-5, -20, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                // key: this.widget.cardKey,
                flipOnTouch: false,
                front: this.widget.number == null ? CardBackWidget() : CardWidget(number: this.widget.number),
                back: CardBackWidget(),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(this.widget.name),
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
