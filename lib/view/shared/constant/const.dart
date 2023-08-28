import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF035AA6);

const kTextLightColor = Color(0xFF747474);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

class ColorSelect {
//////////////////////////////////////////////////////////////

  static Color cgray = const Color(0xFF575756);
}

TextStyle CustomTextStyle(
    {double? fontsize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontsize,
    color: color,
    fontWeight: fontWeight,
  );
}
