import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dimens {
  double _height;
  double _width;
  double _textScaleFactor;
  double _textSize;

  double get height => _height;

  double get width => _width;

  double get textScaleFactor => _textScaleFactor;

  double get textSize => _textSize;

  Dimens(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _textScaleFactor = MediaQuery.of(context).textScaleFactor;
    _textSize = _textScaleFactor == 1
        ? 16
        : _textScaleFactor > 1 ? _textScaleFactor * 12 : _textScaleFactor * 20;
  }
}
