import 'dart:convert';

import 'package:ibiz/models/WithdrawHistory.dart';
import 'package:http/http.dart' as http;

class WithdrawHistoryDb {
  Future<List<WithdrawHistory>> getWithdrawList({uid}) async {
    print(uid);
    final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";

    http.Response response =
        await http.get(url + "withdrawHistory"); //apppend uid is remaining
    List list = json.decode(response.body)['data'];
    print(list.length);

    if (response.statusCode == 200) {
      // print(response.body);
      return List.generate(list.length, (index) {
        // print(index);
        return WithdrawHistory(
            id: list[index]['_id'],
            BankAccountNumber: list[index]['BankAccountNumber'].toString(),
            IFSC: list[index]['IFSC'],
            UPI: list[index]['UPI'],
            name: list[index]['name'],
            request_number: list[index]['request_number'],
            total_amount: list[index]['total_amount'],
            date: list[index]['createdAt'].toString());
      });
    } else {
      print(response.body);
      return null;
    }
  }
}
