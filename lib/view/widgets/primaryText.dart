import 'dart:ui';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final Alignment alignment;
  final TextAlign textAlign;
  final int maxLines;
  const PrimaryText(
      {Key key,
      this.text = "",
      this.fontSize = 18,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.alignment = Alignment.center,
      this.textAlign = TextAlign.center,
      this.maxLines = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        child: Text(text,
            textAlign: textAlign,
            maxLines: maxLines,
            style: TextStyle(
              height: 1.5,
              fontSize: fontSize,
              color: textColor,
              fontWeight: fontWeight,
              fontFamily: "GTWalsheim",
            )));
  }
}
