import 'package:ibiz/models/mycategory.dart';

class MyCategoryDb {
  MyCategory c1 = MyCategory(
      imageUrl: "assets/images/pantry.png",
      brand_name: "Pantry & Dry Goods",
      
      no_of_Stores: 1000);
  MyCategory c2 = MyCategory(
      imageUrl: "assets/images/candy.png",
      brand_name: "Candy & Chocolate",
      
      no_of_Stores: 1000);
  MyCategory c3 = MyCategory(
      imageUrl: "assets/images/clothing.png",
      brand_name: "Clothing, Luggage & Handbags",
      
      no_of_Stores: 1000);
  MyCategory c4 = MyCategory(
      imageUrl: "assets/images/footware.png",
      brand_name: "Footware",
      
      no_of_Stores: 1000);
  MyCategory c5 = MyCategory(
      imageUrl: "assets/images/beverages.png",
      brand_name: "Water & Beverages",
      
      no_of_Stores: 1000);
  MyCategory c6 = MyCategory(
      imageUrl: "assets/images/plastic.png",
      brand_name: "Paper & Plastic Products",
      
      no_of_Stores: 1000);
  MyCategory c7 = MyCategory(
      imageUrl: "assets/images/coffee.png",
      brand_name: "Coffee & Sweetners",
      
      no_of_Stores: 1000);
  MyCategory c8 = MyCategory(
      imageUrl: "assets/images/healthcare.png",
      brand_name: "Health & Personel Care",
      
      no_of_Stores: 1000);
  MyCategory c9 = MyCategory(
      imageUrl: "assets/images/detergent.png",
      brand_name: "Laundry Detergent & Supplies",
      
      no_of_Stores: 1000);
  MyCategory c10 = MyCategory(
      imageUrl: "assets/images/desserts.png",
      brand_name: "Breakfast & Desserts",
      
      no_of_Stores: 1000);

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
