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
                padding: EdgeInsets.only(
                    left: 25 * SizeConfig.widthMultiplier,
                    right: 150 * SizeConfig.widthMultiplier,
                    bottom: 35 * SizeConfig.heightMultiplier,
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
              )
            ],
          )
        ],
      )),
    );
  }
}
