import 'dart:convert';

import 'package:ibiz/models/purchase.dart';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class RetailerDb {
  Future<int> getStores() async {
    String url = Api().baseurl;
    http.Response response = await http.get(url + "retailer");

    List retailerList = json.decode(response.body)['data'];
    //print(retailerList);
    return retailerList.length;
  }
}
