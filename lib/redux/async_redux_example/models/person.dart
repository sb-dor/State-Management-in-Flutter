import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

@immutable
class Person {
  final String? name;
  final int? age;

  const Person({required this.name, required this.age});

  Person.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = int.tryParse("${json['age']}");

  @override
  String toString() {
    // TODO: implement toString
    return "Person name: $name, age: $age";
  }
}

const personUrl =
    "https://raw.githubusercontent.com/sb-dor/rxdart-app/master/apis/persons.json";

Future<Iterable<Person>> getPersons() => HttpClient()
    .getUrl(Uri.parse(personUrl))
    .then((req) => req.close())
    .then((res) => res.transform(utf8.decoder).join())
    .then((jsonToString) => jsonDecode(jsonToString) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));
