import 'dart:convert';

import 'package:ibiz/models/token.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class TokenDb {
  Future<List<Token>> getToken() async {
    final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";

    http.Response response = await http.get(url + "token");

    List tokenList = json.decode(response.body)['data'];
    print(tokenList.length);
    return List.generate(tokenList.length, (index) {
      return Token(
          headerMonthYear: tokenList[index]['month_year'],
          headerDate: tokenList[index]['upload_date'],
          totalRevenue: tokenList[index]['total_revenue'],
          oparatingExpenses: tokenList[index]['operating_expenses'],
          interest: tokenList[index]['interest_and_taxes'],
          serviceFee: tokenList[index]['service_fee'],
          netProfit: tokenList[index]['net_profit'],
          totalTokens: tokenList[index]['total_number_of_tokens'],
          dividendPerToken: tokenList[index]['divident_per_token']);
    });
  }
}
