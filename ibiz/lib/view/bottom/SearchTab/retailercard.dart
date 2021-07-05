import 'dart:ui';
import 'package:ibiz/models/retailer.dart';
import 'package:ibiz/size_config.dart';
import 'package:flutter/material.dart';

class RetailerCard extends StatelessWidget {
  final Retailer retailer;
  RetailerCard({this.retailer});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 114 * SizeConfig.heightMultiplier,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/default.png'),
              image: NetworkImage(retailer.imageUrl),
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
                // Text('No of Srores',
                Text('Location',
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
                // Text('   ' + retailer.no_of_stores.toString(),
                Text('   ' + retailer.city,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11 * SizeConfig.heightMultiplier)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
