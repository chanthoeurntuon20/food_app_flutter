import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

  String gilroyFontFamily = "Gilroy";
  Color _primaryColor = HexColor('#004d99');
  Color _accentColor = HexColor('#0066cc');
  
ThemeData themeData = ThemeData(
  primaryColor: _primaryColor,
  accentColor: _accentColor,
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
