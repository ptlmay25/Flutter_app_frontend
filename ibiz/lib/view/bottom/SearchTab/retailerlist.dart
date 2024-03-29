import 'package:ibiz/models/retailer.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/view/bottom/SearchTab/retailercard.dart';

import '../../../size_config.dart';

class RetailerList extends StatefulWidget {
  List<Retailer> retailers;
  RetailerList({this.retailers});
  @override
  _RetailerListState createState() => _RetailerListState();
}

class _RetailerListState extends State<RetailerList> {
  @override
  Widget build(BuildContext context) {
    List<Retailer> retailers = widget.retailers;
    return GridView.count(
        childAspectRatio:(165 * SizeConfig.widthMultiplier) /
            (174 * SizeConfig.heightMultiplier),
        crossAxisCount: 2,
        children: List.generate(retailers.length, (index) {
          return RetailerCard(retailer: retailers[index]);
        }));
  }
}
