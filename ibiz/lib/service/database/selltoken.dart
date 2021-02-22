import 'api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SellToken {
  String url = Api().baseurl;

  Future<bool> sell({body}) async {
    print(body.toString());
    var response = await http.post(url + "buysell/sell/",
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
