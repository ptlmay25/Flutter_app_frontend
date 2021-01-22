import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';

// ignore: camel_case_types
class Withdraw_History extends StatefulWidget {
  Withdraw_History({this.userModel});
  final UserModel userModel;
  @override
  _Withdraw_HistoryState createState() => _Withdraw_HistoryState();
}

// ignore: camel_case_types
class _Withdraw_HistoryState extends State<Withdraw_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25 * SizeConfig.heightMultiplier),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0xff909090),
                        width: 0.50,
                      ),
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            )))),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 25 * SizeConfig.widthMultiplier,
                    right: 150 * SizeConfig.widthMultiplier,
                    top: 38 * SizeConfig.heightMultiplier),
                child: SizedBox(
                  width: 200,
                  height: 30,
                  child: Text(
                    "Withdrawal History :",
                    style: TextStyle(
                      color: Color(0xff151515),
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25 * SizeConfig.heightMultiplier,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 28 *
                                                SizeConfig.widthMultiplier),
                                        child: Text(
                                          "Withdrawal No: W-1023569",
                                          style: TextStyle(
                                            color: Color(0xff151515),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 23 *
                                                SizeConfig.widthMultiplier),
                                        child: Text(
                                          "Date: 10/12/2020",
                                          style: TextStyle(
                                            color: Color(0xff151515),
                                            fontSize: 14,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "- 5,000 INR",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff8c2f0f),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          )
        ],
      )),
    );
  }
}
