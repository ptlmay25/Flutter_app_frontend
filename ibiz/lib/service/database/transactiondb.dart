import 'dart:convert';

import 'package:ibiz/models/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class TokenDb {
  Future<List<Transaction>> getTransactions() async {
    // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";
    String url = Api().baseurl;
    http.Response response = await http.get(url + "transaction");

    List transactionList = json.decode(response.body)['data'];
    // print("tokenResp:"+transactionList[0].toString());
    print(transactionList.length);
    return List.generate(transactionList.length, (index) {
      return Transaction(
          type: transactionList[index]['type'],
          amount: double.parse(transactionList[index]['amount'].toString()),
          date: transactionList[index]['date'].toString(),
          number_of_tokens: double.parse(
              transactionList[index]['number_of_tokens'].toString()),
          token_price:
              double.parse(transactionList[index]['token_price'].toString()));
    });
  }
}