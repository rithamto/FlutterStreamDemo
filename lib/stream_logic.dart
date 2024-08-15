// ignore_for_file: void_checks

import 'dart:async';
import 'dart:convert';
import 'dart:io';

Stream<String> imageStream() async* {
  var client = HttpClient();
  var uri = Uri.parse('https://api.thecatapi.com/v1/images/search');

  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    var map = json.decode(data);
    yield map[0]['url'].toString();
  }
}
