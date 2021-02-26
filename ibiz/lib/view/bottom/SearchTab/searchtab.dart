import 'package:flutter/material.dart';
import 'package:ibiz/view/bottom/SearchTab/categorylist.dart';

import 'package:ibiz/size_config.dart';
import 'package:intl/intl.dart';
import 'package:ibiz/service/database/tokendb.dart';
import 'package:ibiz/models/token.dart';

class Searchtab extends StatefulWidget {
  @override
  _SearchtabState createState() => _SearchtabState();
}

class _SearchtabState extends State<Searchtab> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  Widget build(BuildContext context) {
    Future<List<Token>> tokenList = TokenDb().getToken();
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 66, 71, 112),
            height: 160 * SizeConfig.heightMultiplier,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                FutureBuilder(
                    future: tokenList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Token latestToken = snapshot.data[0];
                        return Text(
                          curf.format(latestToken.netProfit),
                          style: TextStyle(
                              fontSize: 22 * SizeConfig.heightMultiplier,
                              color: Colors.white),
                        );
                      } else {
                        return Text(
                          curf.format(0),
                          style: TextStyle(
                              fontSize: 22 * SizeConfig.heightMultiplier,
                              color: Colors.white),
                        );
                      }
                    }),
                Text(
                  'Last month profit',
                  style: TextStyle(
                      fontSize: 15 * SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 255, 212, 31)),
                ),
                SizedBox(height: 20 * SizeConfig.heightMultiplier),
                Padding(
                  padding: EdgeInsets.only(
                      left: 36 * SizeConfig.widthMultiplier,
                      right: 36 * SizeConfig.widthMultiplier),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Total Brands",
                        style: TextStyle(
                            fontSize: 16 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      )),
                      Text(
                        'No. Stores',
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
                      left: 36 * SizeConfig.widthMultiplier,
                      right: 36 * SizeConfig.widthMultiplier),
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
          Container(
            child: Padding(
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
                          "Top Brands",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18 * SizeConfig.heightMultiplier),
                        )),
                  ),
                  Container(
                      height: 450, 
                      child: CategoryList())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
