import 'package:project_flutter/screens/splash_screen.dart';
import 'package:project_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RestApp extends StatelessWidget {
  Color _primaryColor = Color(0xff53B175);//HexColor('#004d99');
  Color _accentColor = Color(0xff7C7C7C); //HexColor('#0066cc');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
