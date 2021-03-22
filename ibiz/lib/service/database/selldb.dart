import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';
import 'package:ibiz/models/sell.dart';

class SellDb {
  String url = Api().baseurl + 'app/api/';
  Future<List<Sell>> getSell({id}) async {
    // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";

    http.Response response = await http.get(url + "sell/view/user/" + id);

    List sellList = json.decode(response.body)['data'];
    //print("length" + sellList.toString());

    if (sellList.length == 0) {
      return List.generate(1, (index) {
        return Sell(
          amount: 0,
          num_of_tokens: 0,
          date: DateTime.parse(DateTime.now().toString()),
        );
      });
    }
    return List.generate(sellList.length, (index) {
      return Sell(
          id: sellList[index]['_id'],
          user_id: sellList[index]['user_id'] ?? 0,
          amount: double.parse((sellList[index]['num_of_tokens'] *
                      sellList[index]['token_price'])
                  .toString()) ??
              0,
          date: DateTime.parse(sellList[index]['createdAt']),
          num_of_tokens:
              double.parse(sellList[index]['num_of_tokens'].toString()) ?? 0,
          token_price:
              double.parse(sellList[index]['token_price'].toString()) ?? 0);
    });
  }
}
