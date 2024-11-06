import 'package:get/get.dart';
import 'package:ocr/constants/keys.dart';
import 'translator_service.dart';

class BaseProvider extends GetConnect {

  @override
  void onInit() {
    print('BaseProvider - onInit');
    httpClient.baseUrl = 'https://api.cognitive.microsofttranslator.com';
    httpClient.addRequestModifier<void>((requset) {
      requset.headers['Ocp-Apim-Subscription-Key'] = azureKey1;
      requset.headers['Ocp-Apim-Subscription-Region'] = azureLocal;
      requset.headers['Content-type'] = 'application/json';
      requset.headers['X-ClientTraceId'] = uuid.v4();
      return requset;
    });
    httpClient.addResponseModifier((req, resp) {
      return resp;
    });
  }
}

abstract class ITranslatorProvider {
  Future<Response<dynamic>?> dictionary();
}

class TranslatorProvider extends BaseProvider implements ITranslatorProvider {

  @override
  void onInit() {
    // TODO: implement onInit
    print('TranslatorProvider - onInit');
    super.onInit();
  }
  @override
  Future<Response<dynamic>?> dictionary() async {

    Response resp = await post('/dictionary/lookup', [{'Text':'fly'}], query: query.toJson());
    print(resp.body);
    return resp;
  }
  
}
  