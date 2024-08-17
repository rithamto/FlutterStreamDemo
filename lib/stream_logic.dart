// ignore_for_file: void_checks

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StreamLogic {
  final StreamController<String> streamCtrl =
      StreamController<String>.broadcast();
  Stream<String> get mainStream => streamCtrl.stream;
  var client = HttpClient();
  var uri = Uri.parse('https://api.thecatapi.com/v1/images/search');

  imageStream() async {
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    var map = json.decode(data);
    streamCtrl.sink.add(map[0]['url'].toString());
  }
}
