import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;

  static bool isPotrait = true;
  static bool isMobilePotrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPotrait = true;
      if (_screenWidth < 450) {
        isMobilePotrait = true;
      }
    } else {
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;
      isPotrait = false;
      isMobilePotrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    //Jenil
    // textMultiplier = _blockHeight;
    // imageSizeMultiplier = _blockWidth;
    // heightMultiplier = _blockHeight;
    // widthMultiplier = _blockWidth;

    //Jiten
    textMultiplier = _blockHeight / 8.34909090909091;
    imageSizeMultiplier = _blockWidth / 3.9272727272727277;
    heightMultiplier = _blockHeight / 8.34909090909091;
    widthMultiplier = _blockWidth / 3.9272727272727277;
    print("Block Width" + _blockWidth.toString());
    print("Block Height" + _blockHeight.toString());
  }
}
