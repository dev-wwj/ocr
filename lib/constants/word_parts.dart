enum WordPart {
  noun,
  pronoun,
  adjective,
  numeral,
  verb,
  adverb,
  article,
  preposition,
  conjunction,
  interjection,
}

extension WordPartEx on WordPart {
  static WordPart stringToPart(String name) {
    switch (name.toLowerCase()) {
      case "noun":
        return WordPart.noun;
      case "pronoun":
        return WordPart.pronoun;
      case "adjective":
        return WordPart.adjective;
      case "numeral":
        return WordPart.numeral;
      case "verb":
        return WordPart.verb;
      case "adverb":
        return WordPart.adverb;
      case "article":
        return WordPart.article;
      case "preposition":
        return WordPart.preposition;
      case "conjunction":
        return WordPart.conjunction;
      case "interjection":
        return WordPart.interjection;
      default:
        throw ArgumentError('Unknow WordPart: $name');
    }
  }

  static String simple(WordPart? part) {
    switch (part) {
      case WordPart.noun:
        return "n.";
      case WordPart.pronoun:
        return "pron.";
      case WordPart.adjective:
        return "adj.";
      case WordPart.numeral:
        return "num.";
      case WordPart.verb:
        return "v.";
      case WordPart.adverb:
        return "adv.";
      case WordPart.article:
        return "art.";
      case WordPart.preposition:
        return "prep.";
      case WordPart.conjunction:
        return "conj.";
      case WordPart.interjection:
        return "int.";
      default:
        throw ArgumentError("Unknow WordPart: $part");
    }
  }
}
