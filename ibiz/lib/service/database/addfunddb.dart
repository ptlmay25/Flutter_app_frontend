import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class AddFundDB {
  // String url = "https://tranquil-river-00045.herokuapp.com/api/";
  String url = Api().baseurl+'app/api/';
  Future<bool> add({body}) async {
    print(body.toString());

    var response = await http.post(url + "deposit/add",
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      print("Fund Added");
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }
}
