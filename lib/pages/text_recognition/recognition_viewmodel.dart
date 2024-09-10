import 'package:flutter/cupertino.dart';

class RecognitionViewmodel with ChangeNotifier {

  String? _text;

  String? get text => _text;

  void setText(String? text) {
    _text = text;
    notifyListeners();
  }


}