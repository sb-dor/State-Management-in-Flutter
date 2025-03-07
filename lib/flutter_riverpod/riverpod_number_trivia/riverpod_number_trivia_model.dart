import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RiverpodNumberTriviaModel {
  final TextEditingController textEditingController;

  final String id;
  String? text;
  final int? number;
  bool edit;

  RiverpodNumberTriviaModel(this.text, this.number, {this.edit = false})
    : id = const Uuid().v4(),
      textEditingController = TextEditingController(text: text);

  factory RiverpodNumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return RiverpodNumberTriviaModel(
      json['text'],
      int.tryParse("${json['number']}"),
    );
  }
}
