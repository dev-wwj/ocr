import 'package:get/get.dart';

class UiTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'ocr':'Ocr',
      'home':'Home',
      'scan fetch': 'Scan fetch',
    },
    'zh_CN':{
      'ocr':'扫描',
      'home':'首页',
      'scan fetch':'扫描取词'
    }
  };

}