import 'package:json_annotation/json_annotation.dart';
import 'package:ocr/ui/pages/text_recognition/model/translator_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:ocr/constants/keys.dart';

part 'translator_service.g.dart';


TranslatorQuery query =  TranslatorQuery(from: 'en', to: ['zh-Hans','fr']);

@RestApi(baseUrl: 'https://api.cognitive.microsofttranslator.com')
abstract class TranslatorService {
  factory TranslatorService(Dio dio, {String? baseUrl}) = _TranslatorService;

  @POST('/translate')
  @Headers(<String, dynamic>{
    'Ocp-Apim-Subscription-Key': azureKey1,
    'Ocp-Apim-Subscription-Region': azureLocal,
    'Content-type': 'application/json',
    'X-ClientTraceId': '110ec58a-a0f2-4ac4-8393-c866d813b8d3'
  })

  Future<List<TranslatorModel>> translate(
      @Queries() TranslatorQuery query, @Body() List<TranslatorBody> body);

}

@JsonSerializable()
class TranslatorQuery {
  @JsonKey(name: 'api-version')
  String version = '3.0';
  String from;
  List<String> to;
  TranslatorQuery({required this.from, required this.to});

  Map<String, dynamic> toJson() {
    return _$TranslatorQueryToJson(this);
  }
}

@JsonSerializable()
class TranslatorBody {
  String text;
  TranslatorBody({required this.text});

  Map<String, dynamic> toJson() => _$TranslatorBodyToJson(this);
}
