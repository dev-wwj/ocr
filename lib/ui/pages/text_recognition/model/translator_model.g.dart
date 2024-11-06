// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslatorModel _$TranslatorModelFromJson(Map<String, dynamic> json) =>
    TranslatorModel(
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranslatorModelToJson(TranslatorModel instance) =>
    <String, dynamic>{
      'translations': instance.translations,
    };

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
      text: json['text'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'to': instance.to,
    };
