import 'dart:ui';

import 'package:ibiz/models/mycategory.dart';
import 'package:ibiz/service/database/api.dart';
import 'package:ibiz/size_config.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final MyCategory myCategory;
  CategoryCard({this.myCategory});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 3 * SizeConfig.widthMultiplier,
                  right: 3 * SizeConfig.widthMultiplier,
                  top: 3 * SizeConfig.heightMultiplier,
                  bottom: 3 * SizeConfig.heightMultiplier),
              child: SizedBox(
                height: 114 * SizeConfig.heightMultiplier,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/default.png'),
                  image: NetworkImage(myCategory.imageUrl),
                  // image: NetworkImage(
                  //     "http://chemindigest.com/wp-content/uploads/2020/11/Crude-Refining-Capacity-to-Climb-80-by-2025PM-Modi.jpg"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10 * SizeConfig.heightMultiplier,
                  left: 10 * SizeConfig.widthMultiplier,
                  right: 9 * SizeConfig.heightMultiplier),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Brand",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11 * SizeConfig.heightMultiplier),
                  )),
                  Text('No of Products',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11 * SizeConfig.heightMultiplier)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10 * SizeConfig.heightMultiplier,
                  left: 10 * SizeConfig.widthMultiplier,
                  right: 9 * SizeConfig.heightMultiplier),
              child: Row(
                children: [
                  Expanded(
                    child: Text(myCategory.brand_name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11 * SizeConfig.heightMultiplier)),
                  ),
                  Text('   ' + myCategory.no_of_products.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11 * SizeConfig.heightMultiplier)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
