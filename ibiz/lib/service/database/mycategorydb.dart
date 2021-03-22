import 'dart:convert';

import 'package:ibiz/models/mycategory.dart';
import 'package:ibiz/service/database/api.dart';
import 'package:http/http.dart' as http;

class MyCategoryDb {
  String url = Api().baseurl + 'app/api/';
  Future<List<MyCategory>> getBrand() async {
    http.Response response = await http.get(url + "brand");

    List brandList = json.decode(response.body)['data'];

    //print(brandList);

    return List.generate(brandList.length, (index) {
      return MyCategory(
          //id: brandList[index]['_id'],
          brand_name: brandList[index]['brandName'] ?? '',
          no_of_products: brandList[index]["noOfProduct"] ?? 0,
          imageUrl: brandList[index]['brandImg'] ?? '');
    });
  }
  // MyCategory c1 = MyCategory(
  //     imageUrl: "assets/images/pantry.png",
  //     brand_name: "Pantry & Dry Goods",
  //     no_of_Stores: 1000);
  // MyCategory c2 = MyCategory(
  //     imageUrl: "assets/images/candy.png",
  //     brand_name: "Candy & Chocolate",
  //     no_of_Stores: 1000);
  // MyCategory c3 = MyCategory(
  //     imageUrl: "assets/images/clothing.png",
  //     brand_name: "Clothing, Luggage & Handbags",
  //     no_of_Stores: 1000);
  // MyCategory c4 = MyCategory(
  //     imageUrl: "assets/images/footware.png",
  //     brand_name: "Footware",
  //     no_of_Stores: 1000);
  // MyCategory c5 = MyCategory(
  //     imageUrl: "assets/images/beverages.png",
  //     brand_name: "Water & Beverages",
  //     no_of_Stores: 1000);
  // MyCategory c6 = MyCategory(
  //     imageUrl: "assets/images/plastic.png",
  //     brand_name: "Paper & Plastic Products",
  //     no_of_Stores: 1000);
  // MyCategory c7 = MyCategory(
  //     imageUrl: "assets/images/coffee.png",
  //     brand_name: "Coffee & Sweetners",
  //     no_of_Stores: 1000);
  // MyCategory c8 = MyCategory(
  //     imageUrl: "assets/images/healthcare.png",
  //     brand_name: "Health & Personel Care",
  //     no_of_Stores: 1000);
  // MyCategory c9 = MyCategory(
  //     imageUrl: "assets/images/detergent.png",
  //     brand_name: "Laundry Detergent & Supplies",
  //     no_of_Stores: 1000);
  // MyCategory c10 = MyCategory(
  //     imageUrl: "assets/images/desserts.png",
  //     brand_name: "Breakfast & Desserts",
  //     no_of_Stores: 1000);
}
