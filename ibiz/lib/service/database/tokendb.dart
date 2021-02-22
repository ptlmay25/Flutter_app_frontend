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
    print(tokenList.length);
    return List.generate(tokenList.length, (index) {
      return Token(
          headerMonthYear: tokenList[index]['token_date'].toString(),
          headerDate: tokenList[index]['upload_date'].toString(),
          totalRevenue: tokenList[index]['total_revenue'],
          oparatingExpenses: tokenList[index]['operating_expenses'],
          interest: tokenList[index]['interest_and_taxes'],
          serviceFee: tokenList[index]['service_fee'],
          netProfit: tokenList[index]['net_profit'],
          totalTokens: tokenList[index]['total_number_of_tokens'],
          tokenPrice: double.parse(tokenList[index]['token_price'].toString())
          );
    });
  }
}
