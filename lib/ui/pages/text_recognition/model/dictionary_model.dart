import 'package:json_annotation/json_annotation.dart';
import 'package:ocr/constants/word_parts.dart';
import 'package:ocr/ui/pages/text_recognition/model/translator_model.dart';
import 'dart:convert';

import 'package:ocr/utils/extension/string_ex.dart';

part 'dictionary_model.g.dart';

DictionaryModel dictionaryModelFromJson(String str) => DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) => json.encode(data.toJson());

@JsonSerializable()
class DictionaryModel {
  @JsonKey(name: "word")
  final String? word;
  @JsonKey(name: "phonetic")
  final String? phonetic;
  @JsonKey(name: "phonetics")
  final List<Phonetic>? phonetics;
  @JsonKey(name: "meanings")
  final List<Meaning>? meanings;
  @JsonKey(name: "license")
  final License? license;
  @JsonKey(name: "sourceUrls")
  final List<String>? sourceUrls;

  DictionaryModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) => _$DictionaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryModelToJson(this);
}

@JsonSerializable()
class License {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "url")
  final String? url;

  License({
    this.name,
    this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}

@JsonSerializable()
class Meaning {
  @JsonKey(name: "partOfSpeech", fromJson: WordPartEx.stringToPart)
  final WordPart? partOfSpeech;
  @JsonKey(name: "definitions")
  final List<Definition>? definitions;
  @JsonKey(name: "synonyms")
  final List<String>? synonyms;
  @JsonKey(name: "antonyms")
  final List<String>? antonyms;

  Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}

@JsonSerializable()
class Definition {
  @JsonKey(name: "definition")
  final String? definition;
  @JsonKey(name: "synonyms")
  final List<dynamic>? synonyms;
  @JsonKey(name: "antonyms")
  final List<dynamic>? antonyms;
  @JsonKey(name: "example")
  final String? example;

  Definition({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);

  TranslatorModel? translatorModel;

}

@JsonSerializable()
class Phonetic {
  @JsonKey(name: "audio")
  final String? audio;
  @JsonKey(name: "sourceUrl")
  final String? sourceUrl;
  @JsonKey(name: "license")
  final License? license;
  @JsonKey(name: "text")
  final String? text;

  Phonetic({
    this.audio,
    this.sourceUrl,
    this.license,
    this.text,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => _$PhoneticFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticToJson(this);

  bool get verify {
    return text.isNotNullAndNotEmpty && audio.isNotNullAndNotEmpty && sourceUrl.isNotNullAndNotEmpty;
  }

  /*
  * 从audio中查找发音地区字符串
  * */
  String? get local {
    if (audio.isNotNullAndNotEmpty) {
      //https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3
      RegExp regExp = RegExp(r'-.*\.mp3');
      Match? match = regExp.firstMatch(audio!);
      if (match != null) {
        String temp = match[0].toString();
        return temp.substring(1,temp.length - 4);
      }
      return null;
    }
    return null;
  }

}