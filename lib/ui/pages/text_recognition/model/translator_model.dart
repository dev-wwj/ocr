import 'package:json_annotation/json_annotation.dart';
part 'translator_model.g.dart';

@JsonSerializable()
class TranslatorModel {

  @JsonKey(name: 'translations')
  final List<Translation>? translations;

  TranslatorModel({this.translations});

  factory TranslatorModel.fromJson(Map<String, dynamic> json) => _$TranslatorModelFromJson(json);

}

@JsonSerializable()
class Translation {
  @JsonKey(name: "text")
  final String? text;
  @JsonKey(name: "to")
  final String? to;

  Translation({this.text, this.to});

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);

}