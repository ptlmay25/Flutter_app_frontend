import 'dart:ui';
import 'package:ibiz/models/retailer.dart';
import 'package:ibiz/size_config.dart';
import 'package:flutter/material.dart';

class RetailerCard extends StatelessWidget {
  final Retailer retailer;
  RetailerCard({this.retailer});
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
                  image: NetworkImage(retailer.imageUrl),
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
                    "Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11 * SizeConfig.heightMultiplier),
                  )),
                  Text('No of Srores',
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
                    child: Text(retailer.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11 * SizeConfig.heightMultiplier)),
                  ),
                  Text('   ' + retailer.no_of_stores.toString(),
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