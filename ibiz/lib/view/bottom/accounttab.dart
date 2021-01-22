import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/size_config.dart';

class Accounttab extends StatefulWidget {
  final UserModel userModel;
  Accounttab({this.userModel});
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 66, 71, 112),
          toolbarHeight: 260 * SizeConfig.widthMultiplier,
          title: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 50 * SizeConfig.heightMultiplier,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25 * SizeConfig.widthMultiplier),
                      child: Image.asset(
                        "assets/icons/Ellipse 9.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 18 * SizeConfig.widthMultiplier),
                      child: Text(
                        widget.userModel.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 40 * SizeConfig.heightMultiplier,
                    left: 30 * SizeConfig.widthMultiplier),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "₹ 65,000.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10 * SizeConfig.heightMultiplier,
                    bottom: 35 * SizeConfig.widthMultiplier),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30 * SizeConfig.widthMultiplier),
                      child: Text(
                        "Your Balance\n" + "10/10/2020  11:24 AM",
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
                          left: 115 * SizeConfig.widthMultiplier),
                      child: Container(
                        height: 70 * SizeConfig.heightMultiplier,
                        width: 70 * SizeConfig.widthMultiplier,
                        child: IconButton(
                            icon: Image.asset(
                              "assets/icons/Withdraw.png",
                            ),
                            onPressed: null),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 30 * SizeConfig.heightMultiplier,
                left: 22 * SizeConfig.widthMultiplier),
            child: Row(
              children: <Widget>[
                Text(
                  "Transaction",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 135 * SizeConfig.widthMultiplier),
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
                    right: 15 * SizeConfig.widthMultiplier),
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
