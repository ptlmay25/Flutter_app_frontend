import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/navbar/withdrawal_history.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/view/bottom/AccountTab/addfund.dart';

class Accounttab extends StatefulWidget {
  @override
  _AccounttabState createState() => _AccounttabState();
}

class _AccounttabState extends State<Accounttab> {
  String _selectedData;
  List<String> _Data = [
    "Last 7 days",
    "Last 30 days",
    "Last 6 month",
    "Last year",
    "All",
  ];

  @override
  Widget build(BuildContext context) {
    var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
              color: Color.fromARGB(255, 66, 71, 112),
              child: Column(children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 0 * SizeConfig.heightMultiplier),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          curf.format(userModel.acc_bal),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20 * SizeConfig.heightMultiplier),
                        child: Text(
                          "Your Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * SizeConfig.heightMultiplier),
                        child: Text(
                          "10/10/2020  11:24 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 58 * SizeConfig.widthMultiplier,
                            top: 26 * SizeConfig.heightMultiplier,
                            bottom: 38 * SizeConfig.heightMultiplier),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: 40 * SizeConfig.heightMultiplier,
                                width: 120 * SizeConfig.widthMultiplier,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider.value(
                                                    value: userModel,
                                                    child: AddFund())));
                                  },
                                  color: Color.fromARGB(255, 108, 113, 156),
                                  child: Text(
                                    'Add Funds',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            16 * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20 * SizeConfig.widthMultiplier),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: 40 * SizeConfig.heightMultiplier,
                                width: 120 * SizeConfig.widthMultiplier,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Withdraw_History()));
                                  },
                                  color: Color.fromARGB(255, 108, 113, 156),
                                  child: Text(
                                    'Withrow',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            16 * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
          Padding(
            padding: EdgeInsets.only(
                top: 30 * SizeConfig.heightMultiplier,
                left: 22 * SizeConfig.widthMultiplier),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Transaction",
                    style: TextStyle(
                      color: Color(0xff151515),
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 21 * SizeConfig.widthMultiplier),
                  child: Container(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 107 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xff151515),
                        width: 0.50,
                      ),
                      color: Colors.white,
                    ),
                    child: DropdownButton(
                      underline: Container(color: Colors.transparent),
                      hint: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "   Last 7 days",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff151515),
                            fontSize: 12,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      value: _selectedData,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedData = newValue;
                        });
                      },
                      items: _Data.map((data) {
                        return DropdownMenuItem(
                          child: new Text(
                            data,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          value: data,
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 32 * SizeConfig.heightMultiplier,
                    right: 21 * SizeConfig.widthMultiplier),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              width: 210,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 23 * SizeConfig.widthMultiplier),
                                    child: Text(
                                      "Token sell ",
                                      style: TextStyle(
                                        color: Color(0xff151515),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 23 * SizeConfig.widthMultiplier),
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
                      "+ 10,150 INR",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff3c8f7c),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
