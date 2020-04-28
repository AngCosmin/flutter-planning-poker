import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/card.dart';

class PlayerCardWidget extends StatefulWidget {
  final int number;

  const PlayerCardWidget({Key key, this.number}) : super(key: key);

  @override
  _PlayerCardWidgetState createState() => _PlayerCardWidgetState();
}

class _PlayerCardWidgetState extends State<PlayerCardWidget> {
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
      hoverTransform = Matrix4.identity()..scale(1.3, 1.3)..translate(-10, -30, 0);
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
                child: CardWidget(number: this.widget.number)
            ),
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
