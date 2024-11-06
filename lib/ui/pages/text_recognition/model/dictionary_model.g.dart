// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictionaryModel _$DictionaryModelFromJson(Map<String, dynamic> json) =>
    DictionaryModel(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetic.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      sourceUrls: (json['sourceUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DictionaryModelToJson(DictionaryModel instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'phonetics': instance.phonetics,
      'meanings': instance.meanings,
      'license': instance.license,
      'sourceUrls': instance.sourceUrls,
    };

License _$LicenseFromJson(Map<String, dynamic> json) => License(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Meaning _$MeaningFromJson(Map<String, dynamic> json) => Meaning(
      partOfSpeech: WordPartEx.stringToPart(json['partOfSpeech'] as String),
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MeaningToJson(Meaning instance) => <String, dynamic>{
      'partOfSpeech': _$WordPartEnumMap[instance.partOfSpeech],
      'definitions': instance.definitions,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

const _$WordPartEnumMap = {
  WordPart.noun: 'noun',
  WordPart.pronoun: 'pronoun',
  WordPart.adjective: 'adjective',
  WordPart.numeral: 'numeral',
  WordPart.verb: 'verb',
  WordPart.adverb: 'adverb',
  WordPart.article: 'article',
  WordPart.preposition: 'preposition',
  WordPart.conjunction: 'conjunction',
  WordPart.interjection: 'interjection',
};

Definition _$DefinitionFromJson(Map<String, dynamic> json) => Definition(
      definition: json['definition'] as String?,
      synonyms: json['synonyms'] as List<dynamic>?,
      antonyms: json['antonyms'] as List<dynamic>?,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'example': instance.example,
    };

Phonetic _$PhoneticFromJson(Map<String, dynamic> json) => Phonetic(
      audio: json['audio'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PhoneticToJson(Phonetic instance) => <String, dynamic>{
      'audio': instance.audio,
      'sourceUrl': instance.sourceUrl,
      'license': instance.license,
      'text': instance.text,
    };
