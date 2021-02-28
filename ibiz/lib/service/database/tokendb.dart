import 'dart:convert';

import 'package:ibiz/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class TokenDb {
  Future<List<Token>> getToken() async {
    // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";
    String url = Api().baseurl;
    http.Response response = await http.get(url + "token");

    List tokenList = json.decode(response.body)['data'];
    // print("tokenResp:"+tokenList[0].toString());
    // print(tokenList.length);
    if (tokenList.length > 0) {
      return List.generate(tokenList.length, (index) {
        return Token(
            tokenDate: tokenList[index]['createdAt'].toString() ??
                DateTime.now().toString(),
            totalRevenue:
                double.parse(tokenList[index]['total_revenue'].toString()) ?? 0,
            oparatingExpenses:
                double.parse(tokenList[index]['operating_expenses'].toString()) ??
                    0,
            interest:
                double.parse(tokenList[index]['interest_and_taxes'].toString()) ??
                    0,
            split:
                double.parse(tokenList[index]['split_50_50'].toString()) ?? 0,
            netProfit:
                double.parse(tokenList[index]['net_profit'].toString()) ?? 0,
            dividendPerToken:
                double.parse(tokenList[index]['dividend_per_token'].toString()) ??
                    0,
            totalTokens: double.parse(
                    tokenList[index]['total_number_of_tokens'].toString()) ??
                0,
            tokenPrice:
                double.parse(tokenList[index]['token_price'].toStringAsFixed(2)) ??
                    0);
      });
    } else {
      return List.generate(1, (index) {
        return Token(
            tokenDate: DateTime.now().toString(),
            totalRevenue: 0,
            oparatingExpenses: 0,
            interest: 0,
            split: 0,
            netProfit: 0,
            dividendPerToken: 0,
            totalTokens: 0,
            tokenPrice: double.parse("1000".toString()));
      });
    }
  }
}
