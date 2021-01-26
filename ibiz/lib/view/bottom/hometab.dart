import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeScreen/buysheet.dart';
import 'package:ibiz/view/bottom/HomeScreen/profitlist.dart';
import 'package:ibiz/view/bottom/HomeScreen/sellsheet.dart';
import 'package:ibiz/view/bottom/payment_method.dart';

class Hometab extends StatefulWidget {
  final UserModel userModel;
  Hometab({this.userModel});
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 154,
                    child: Column(children: <Widget>[
                      Text(
                        "₹ 2550.25",
                        style: TextStyle(
                            fontSize: 30 * SizeConfig.heightMultiplier,
                            fontFamily: "Roboto",
                            color: Colors.white),
                      ),
                      Text('+15.00 (0.1%) This month',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 212, 31),
                              fontSize: 16 * SizeConfig.heightMultiplier))
                    ]),
                    color: Color.fromARGB(255, 66, 71, 112)),
              ],
            ),
          ),
          Positioned(
              top: 66 * SizeConfig.heightMultiplier,
              left: 12 * SizeConfig.widthMultiplier,
              right: 12 * SizeConfig.widthMultiplier,
              child: Container(
                height: 650 * SizeConfig.heightMultiplier,
                child: ListView(children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 280 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 14 * SizeConfig.heightMultiplier,
                              left: 14 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('25 Jan 2021')),
                        )
                      ]),
                    ),
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 240 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 24 * SizeConfig.heightMultiplier,
                              left: 21 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Your Position',
                                style: TextStyle(
                                  fontSize: 20 * SizeConfig.heightMultiplier,
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25 * SizeConfig.widthMultiplier,
                              right: 25 * SizeConfig.widthMultiplier,
                              top: 30 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                        'NO OF TOKENS',
                                        style: TextStyle(
                                            fontSize: 15 *
                                                SizeConfig.heightMultiplier,
                                            color: Color.fromARGB(
                                                255, 114, 144, 144)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7 *
                                                SizeConfig.heightMultiplier),
                                        child: Text(
                                          '250          ',
                                          style: TextStyle(
                                              fontSize: 25 *
                                                  SizeConfig.heightMultiplier),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'TOTAL DIVIDEND   ',
                                    style: TextStyle(
                                        fontSize:
                                            15 * SizeConfig.heightMultiplier,
                                        color:
                                            Color.fromARGB(255, 114, 144, 144)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 7 * SizeConfig.heightMultiplier),
                                    child: Text(
                                      '₹ 55,650.25',
                                      style: TextStyle(
                                          fontSize:
                                              25 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25 * SizeConfig.widthMultiplier,
                              right: 25 * SizeConfig.widthMultiplier,
                              top: 20 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                        'PRICE PER TOCKEN',
                                        style: TextStyle(
                                            fontSize: 15 *
                                                SizeConfig.heightMultiplier,
                                            color: Color.fromARGB(
                                                255, 114, 144, 144)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7 *
                                                SizeConfig.heightMultiplier),
                                        child: Text(
                                          '₹ 3550.00   ',
                                          style: TextStyle(
                                              fontSize: 25 *
                                                  SizeConfig.heightMultiplier),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'TOTAL RETURN     ',
                                    style: TextStyle(
                                        fontSize:
                                            15 * SizeConfig.heightMultiplier,
                                        color:
                                            Color.fromARGB(255, 114, 144, 144)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 7 * SizeConfig.heightMultiplier),
                                    child: Text(
                                      '4.05%           ',
                                      style: TextStyle(
                                          fontSize:
                                              25 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13)),
                      height: 80 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15 * SizeConfig.heightMultiplier,
                                  left: 25 * SizeConfig.widthMultiplier,
                                  right: 20 * SizeConfig.widthMultiplier,
                                  bottom: 15 * SizeConfig.heightMultiplier),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 45 * SizeConfig.heightMultiplier,
                                  width: 140 * SizeConfig.widthMultiplier,
                                  child: RaisedButton(
                                    onPressed: showBuyBottomSheet,
                                    color: Color.fromARGB(255, 66, 71, 112),
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize:
                                              16 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15 * SizeConfig.heightMultiplier,
                                  bottom: 15 * SizeConfig.heightMultiplier),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 45 * SizeConfig.heightMultiplier,
                                  width: 140 * SizeConfig.widthMultiplier,
                                  child: RaisedButton(
                                    onPressed: showSellBottomSheet,
                                    color: Color.fromARGB(255, 66, 71, 112),
                                    child: Text(
                                      'Sell',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize:
                                              16 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Card(
                    child: Container(
                      height: 411 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20 * SizeConfig.widthMultiplier,
                                  top: 20 * SizeConfig.heightMultiplier),
                              child: Text(
                                "Profit History",
                                style: TextStyle(
                                    fontSize: 20 * SizeConfig.heightMultiplier),
                              ),
                            )),
                        Expanded(child: ProfitList())
                      ]),
                    ),
                  ),
                ]),
              )),
        ],
      ),
    );
  }

  showBuyBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return BuySheet();
        });
  }

  showSellBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return SellSheet();
        });
  }
}
