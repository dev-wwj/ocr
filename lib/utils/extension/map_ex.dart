import 'dart:convert';

extension MapToJsonEx on Map<String, dynamic> {

  String toJson() {
    return jsonEncode(this);
  }
}