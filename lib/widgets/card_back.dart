import 'package:flutter/material.dart';

class CardBackWidget extends StatelessWidget {
  final double width;
  final double height;

  const CardBackWidget({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      width: this.width,
      height: this.height,
    );
  }
}
