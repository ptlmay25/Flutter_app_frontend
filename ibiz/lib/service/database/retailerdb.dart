import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibiz/models/retailer.dart';
import 'package:ibiz/service/database/api.dart';

class RetailerDb {
  String url = Api().baseurl + 'app/api/';
  Future<List<Retailer>> getStores() async {
    http.Response response = await http.get(url + "retailer");

    List retailerList = json.decode(response.body)['data'];
    //print(retailerList);
    return List.generate(retailerList.length, (index) {
      return Retailer(
          //id: retailerList[index]['_id'],
          name: retailerList[index]['storeName'] ?? '',
          city: retailerList[index]['city'] ?? '',
          no_of_stores: retailerList[index]["numberOfStores"] ?? 0,
          imageUrl: retailerList[index]['storeImg'] ?? '');
    });
  }
}
