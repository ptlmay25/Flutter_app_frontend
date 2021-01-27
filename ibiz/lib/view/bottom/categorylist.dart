import 'package:ibiz/service/database/mycategorydb.dart';
import 'package:ibiz/models/mycategory.dart';
import 'package:ibiz/view/bottom/categorycard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final List<MyCategory> myCategories =MyCategoryDb().getList();
        
    if (myCategories == null) {
      return Container(child: Text("No Items"));
    } else {
      return GridView.count(
          childAspectRatio:3/4 ,
          crossAxisCount: 2,
          children: List.generate(myCategories.length, (index) {
            return CategoryCard(myCategory: myCategories[index]);
          }));
    }
  }
}