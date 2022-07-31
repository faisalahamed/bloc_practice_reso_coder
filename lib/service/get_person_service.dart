import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:bloc_learing/model/person.dart';

class GetPersonService {
  // Future<List<Person>> getPerson({required String url}) => HttpClient()
  //     .getUrl(Uri.parse(url))
  //     .then((req) => req.close())
  //     .then((res) => res.transform(utf8.decoder).join())
  //     // .then((str) => json.decode(str) as List<dynamic>)
  //     // .then((list) => list.map((e) => Person.fromJson(e)));
  //     .then((str) => personFromJson(str));

  Future<List<Person>> getPerson({required String url}) async {
    try {
      final res = await http.get(Uri.parse(url));
      return personFromJson(res.body);
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }
}
