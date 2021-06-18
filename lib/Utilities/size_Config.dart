

import 'package:flutter/material.dart';

class SizeConfig {

  static double screenWidth;
  static double screenHeight;
  static double blockSizeVertical;
  static double blockSizeHorizontal;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation){
    if(orientation == Orientation.portrait){
      screenHeight = constraints.maxHeight;
      screenWidth = constraints.maxWidth;
      isPortrait = true;
      if(screenWidth < 400){
        isMobilePortrait = true;
      }
    }
    else{
      screenHeight = constraints.maxWidth;
      screenWidth = constraints.maxHeight;
      isPortrait = false;
      isMobilePortrait = false;
    }
    blockSizeVertical = screenHeight/100;
    blockSizeHorizontal = screenWidth/100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier= blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;

    print(screenWidth);
  }
}