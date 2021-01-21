import 'package:ibiz/models/mycategory.dart';

class MyCategoryDb {
  MyCategory c1 = MyCategory(
      imageUrl: "assets/images/pantry.png",
      name: "Pantry & Dry Goods",
      min: "\$ 1000",
      margin: "3 - 25 %");
  MyCategory c2 = MyCategory(
      imageUrl: "assets/images/candy.png",
      name: "Candy & Chocolate",
      min: "\$ 1000",
      margin: "5 - 45 %");
  MyCategory c3 = MyCategory(
      imageUrl: "assets/images/clothing.png",
      name: "Clothing, Luggage & Handbags",
      min: "\$ 1000",
      margin: "10 - 50 %  ");
  MyCategory c4 = MyCategory(
      imageUrl: "assets/images/footware.png",
      name: "Footware",
      min: "\$ 1000",
      margin: "7 - 30 %");
  MyCategory c5 = MyCategory(
      imageUrl: "assets/images/beverages.png",
      name: "Water & Beverages",
      min: "\$ 1000",
      margin: "5 - 45 %");
  MyCategory c6 = MyCategory(
      imageUrl: "assets/images/plastic.png",
      name: "Paper & Plastic Products",
      min: "\$ 1000",
      margin: "5 - 45 %");
  MyCategory c7 = MyCategory(
      imageUrl: "assets/images/coffee.png",
      name: "Coffee & Sweetners",
      min: "\$ 1000",
      margin: "7 - 35 %");
  MyCategory c8 = MyCategory(
      imageUrl: "assets/images/healthcare.png",
      name: "Health & Personel Care",
      min: "\$ 1000",
      margin: "5 - 45 %");
  MyCategory c9 = MyCategory(
      imageUrl: "assets/images/detergent.png",
      name: "Laundry Detergent & Supplies",
      min: "\$ 1000",
      margin: "3 - 25 %");
  MyCategory c10 = MyCategory(
      imageUrl: "assets/images/desserts.png",
      name: "Breakfast & Desserts",
      min: "\$ 1000",
      margin: "3 - 25 %");

  List<MyCategory> getList() {
    //final myCategories = List.generate(4, (index) =>c1);
    List<MyCategory> myCategories = new List<MyCategory>();
    myCategories.add(c1);
    myCategories.add(c6);
    myCategories.add(c2);
    myCategories.add(c7);
    myCategories.add(c3);
    myCategories.add(c8);
    myCategories.add(c4);
    myCategories.add(c9);
    myCategories.add(c5);
    myCategories.add(c10);
    return myCategories;
  }
}
