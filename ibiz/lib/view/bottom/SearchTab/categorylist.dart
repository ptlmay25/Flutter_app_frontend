import 'package:ibiz/models/mycategory.dart';
import 'package:ibiz/view/bottom/SearchTab/categorycard.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  List<MyCategory> categories;
  CategoryList({this.categories});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List<MyCategory> myCategories = widget.categories;
    return GridView.count(
        childAspectRatio: 165 / 174,
        crossAxisCount: 2,
        children: List.generate(myCategories.length, (index) {
          return CategoryCard(myCategory: myCategories[index]);
        }));
  }
}
