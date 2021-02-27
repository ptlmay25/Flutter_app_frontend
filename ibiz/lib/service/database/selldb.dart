import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';
import 'package:ibiz/models/sell.dart';

class SellDb {
  Future<List<Sell>> getSell({id}) async {
    // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";
    String url = Api().baseurl;
    http.Response response = await http.get(url + "sell/"); //id append remains

    List sellList = json.decode(response.body)['data'];
    //print("length" + sellList.toString());

    return List.generate(sellList.length, (index) {
      return Sell(
          id: sellList[index]['_id'],
          user_id: sellList[index]['user_id'] ?? 0,
          amount: double.parse((sellList[index]['num_of_tokens'] 
                   * sellList[index]['token_price']).toString()) ?? 0,
          date: sellList[index]['date'].toString() ?? '',
          num_of_tokens:
              double.parse(sellList[index]['num_of_tokens'].toString()) ?? 0,
          token_price:
              double.parse(sellList[index]['token_price'].toString()) ?? 0);
    });
  }
}
