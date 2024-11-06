import 'package:dio/dio.dart';
import 'package:ocr/ui/pages/text_recognition/model/dictionary_model.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';


@RestApi(baseUrl: 'https://api.dictionaryapi.dev/api/v2/')
abstract class Service {
  // factory RestClient(Dio dio, {
  //   String? baseUrl,
  //   ParseErrorLogger? errorLogger
  // }) = _RestClient;
  factory Service(Dio dio, {String? baseUrl}) = _Service;

  @GET('entries/en/{word}/')
  Future<List<DictionaryModel>> entriesEn(@Path('word') String word);
}

