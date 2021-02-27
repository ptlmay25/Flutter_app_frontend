import 'dart:convert';

import 'package:ibiz/models/purchase.dart';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class PurchaseDb {
  Future<List<Purchase>> getPurchase({id}) async {
    // final String url = "https://tranquil-river-00045.herokuapp.com/api/";
    // final String url = "http://192.168.43.24:5000/api/";
    String url = Api().baseurl;

    http.Response response = await http.get(url + "purchase/view/user/" + id);

    List purchaseList = json.decode(response.body)['data'];
    //print("length" + purchaseList.toString());
    return List.generate(purchaseList.length, (index) {
      return Purchase(
          id: purchaseList[index]['_id'],
          user_id: purchaseList[index]['user_id'],
          amount: double.parse((purchaseList[index]['num_of_tokens'] *
                  purchaseList[index]['token_price'])
              .toString()),
          date: DateTime.parse(purchaseList[index]['createdAt']),
          num_of_tokens:
              double.parse(purchaseList[index]['num_of_tokens'].toString()),
          token_price:
              double.parse(purchaseList[index]['token_price'].toString()));
    });
  }
}
