import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ocr/services/service.dart';
import 'package:ocr/services/translator_service.dart';
import 'package:ocr/utils/extension/string_ex.dart';
import 'model/dictionary_model.dart';
import 'package:ocr/services/translator_provider.dart';


final logger = Logger();

class RecognitionNotifier with ChangeNotifier {

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final dio = Dio();

  bool scanning = true;  //拍照取词中

  String? _text;

  String? get text => _text;

  DictionaryModel? _dictionaryModel;

  DictionaryModel? get dictionaryModel => _dictionaryModel;

  List<TranslatorBody> translatorBodys = [];

  var provider = TranslatorProvider();

  RecognitionNotifier(){
    focusNode.addListener((){
      scanning = !focusNode.hasFocus;
    });
    textEditingController.addListener(() {
        _text = textEditingController.text;
    });
  }

  void setText(String? text) {
    if (scanning == false) return;
    _text = text;
    if (text != null) {
      textEditingController.text = text;
    }
    notifyListeners();
  }

  void setDictionaryModel(DictionaryModel? model) {
    _dictionaryModel = model;
    notifyListeners();
  }

  void entries() async {
    if (text == null) return;
    // final client = Service(dio);
    // var result = await client.entriesEn(text!);
    // setDictionaryModel(result.first);
    // result.first.meanings?.forEach( (meaning) {
    //   meaning.definitions?.forEach((def) => {
    //     if (def.definition.isNotNullAndNotEmpty) {
    //       translatorBodys.add(TranslatorBody(text: def.definition!))
    //     }
    //   });
    // });
    provider.dictionary();

  }

  void translator() async {
    if (text == null || translatorBodys.isEmpty) return;
    final client = TranslatorService(dio);
    var result = await client.translate(query, translatorBodys);
    logger.i(result);

    _dictionaryModel?.meanings?.forEach( (meaning) {
      meaning.definitions?.forEach((def) {
        if (def.definition.isNotNullAndNotEmpty) {
          def.translatorModel = result.first;
          result.removeAt(0);
        }
      });
    });
    notifyListeners();
  }
}