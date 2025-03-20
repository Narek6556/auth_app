import 'package:flutter/material.dart';

class Responsivnes {
  static double referanceHeight = 844;

  static double referanceWidth = 390;

  static num byHeight(BuildContext context, num height) {
    double screenHeight = MediaQuery.of(context).size.height;

    return (height / referanceHeight) * screenHeight;
  }

  static num byWidth(BuildContext context, num width) {
    double screenWidth = MediaQuery.of(context).size.height;
    
    return (width / referanceWidth) * screenWidth;
  }
}
