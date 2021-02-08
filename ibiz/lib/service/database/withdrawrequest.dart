import 'dart:convert';

import 'package:http/http.dart' as http;

class WithdrawRequest {
  final String url = "https://tranquil-river-00045.herokuapp.com/api/";
  // final String url = "http://192.168.43.24:5000/api/";

  Future<bool> request({userId, name, UPI, accNo, IFSC, amount}) async {
    Map data = {
      "userId": userId,
      "UPI": UPI,
      "BankAccountNumber": accNo,
      "IFSC": IFSC,
      "total_amount": amount
    };
    var response = await http.post(url + "withdrawrequest/add",
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
