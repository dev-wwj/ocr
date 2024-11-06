// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslatorQuery _$TranslatorQueryFromJson(Map<String, dynamic> json) =>
    TranslatorQuery(
      from: json['from'] as String,
      to: (json['to'] as List<dynamic>).map((e) => e as String).toList(),
    )..version = json['api-version'] as String;

Map<String, dynamic> _$TranslatorQueryToJson(TranslatorQuery instance) =>
    <String, dynamic>{
      'api-version': instance.version,
      'from': instance.from,
      'to': instance.to,
    };

TranslatorBody _$TranslatorBodyFromJson(Map<String, dynamic> json) =>
    TranslatorBody(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TranslatorBodyToJson(TranslatorBody instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _TranslatorService implements TranslatorService {
  _TranslatorService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://api.cognitive.microsofttranslator.com';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<TranslatorModel>> translate(
    TranslatorQuery query,
    List<TranslatorBody> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query.toJson());
    final _headers = <String, dynamic>{
      r'Ocp-Apim-Subscription-Key': '91a77d7b0475405fa62579097687eb94',
      r'Ocp-Apim-Subscription-Region': 'eastasia',
      r'Content-type': 'application/json',
      r'X-ClientTraceId': '110ec58a-a0f2-4ac4-8393-c866d813b8d3',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = body.map((e) => e.toJson()).toList();
    final _options = _setStreamType<List<TranslatorModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
        .compose(
          _dio.options,
          '/translate',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    print(_result);
    late List<TranslatorModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              TranslatorModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
