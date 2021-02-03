import 'package:ibiz/models/mycategory.dart';
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
              child: Image.asset(myCategory.imageUrl),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10 * SizeConfig.heightMultiplier,
                  left: 5 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    myCategory.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
                  Text('Margin  ',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10 * SizeConfig.heightMultiplier,
                  left: 5 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Min-${myCategory.min}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(myCategory.margin,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
