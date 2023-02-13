import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

var header = {};
const uri = 'http://127.0.0.1:3333';

Future<http.Response> fetchAlbum() async {
  return await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

Future<http.Response> login(Object form) async {
  return await http.post(Uri.parse('${uri}/login'), body: form).then((value) {
    print(value.body);
    var token = jsonDecode(value.body)['token'];
    header = {HttpHeaders.authorizationHeader: token};
    return value;
  });
}
