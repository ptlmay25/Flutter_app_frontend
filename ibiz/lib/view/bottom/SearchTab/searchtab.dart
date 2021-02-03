import 'package:flutter/material.dart';
import 'package:ibiz/view/bottom/SearchTab/categorylist.dart';

import 'package:ibiz/size_config.dart';

class Searchtab extends StatefulWidget {
  @override
  _SearchtabState createState() => _SearchtabState();
}

class _SearchtabState extends State<Searchtab> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
        toolbarHeight: 160 * SizeConfig.heightMultiplier,
        title: Align(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Text(
              '₹ 10,00,000.00',
              style: TextStyle(fontSize: 22 * SizeConfig.heightMultiplier),
            ),
            Text(
              'Last month revenue',
              style: TextStyle(
                  fontSize: 15 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 212, 31)),
            ),
            SizedBox(height: 20 * SizeConfig.heightMultiplier),
            Padding(
              padding: EdgeInsets.only(
                  left: 42 * SizeConfig.widthMultiplier,
                  right: 42 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Total Hotels",
                    style: TextStyle(
                        fontSize: 16 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
                  Text(
                    'No. Rooms',
                    style: TextStyle(
                        fontSize: 16 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(height: 10 * SizeConfig.heightMultiplier),
            Padding(
              padding: EdgeInsets.only(
                  left: 42 * SizeConfig.widthMultiplier,
                  right: 42 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "125",
                    style: TextStyle(
                        fontSize: 16 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
                  Text(
                    '4,250',
                    style: TextStyle(
                        fontSize: 16 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 15 * SizeConfig.widthMultiplier,
            right: 15 * SizeConfig.widthMultiplier),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 40 * SizeConfig.heightMultiplier,
                  bottom: 20 * SizeConfig.heightMultiplier),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Franchises",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 * SizeConfig.heightMultiplier),
                  )),
            ),
            Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
