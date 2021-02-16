import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactUsDb {
  final String url = "https://tranquil-river-00045.herokuapp.com/api/";
  // final String url = "http://192.168.43.24:5000/api/";

  Future<bool> contact({userId, accNo, name, email, message}) async {
    Map data = {
      "userId": userId,
      "date": DateTime.now().toString(),
      "BankAccountNumber": accNo,
      "name": name,
      "email": email,
      "message": message
    };
    var response = await http.post(url + "contact/add",
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      print("Failure");
      return false;
    }
  }
}
