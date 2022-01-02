import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_flutter/common/app_text.dart';

class FavouriteScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: AppText(
          text: "Order Lists",
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:  Container(
      child: Center(
        child: AppText(
          text: 'No Favorite Items',
          color: Color(0xFF7C7C7C),
          textAlign: TextAlign.center
          ),
      ),
    ),
    );  
  }   
}
