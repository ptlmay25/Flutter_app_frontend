import 'package:flutter/material.dart';
import 'package:ibiz/models/WithdrawHistory.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/witdhrawhistorydb.dart';
import 'package:ibiz/size_config.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Withdraw_History extends StatefulWidget {
  Withdraw_History({this.userModel, this.data});
  final List<WithdrawHistory> data;
  final UserModel userModel;
  @override
  _Withdraw_HistoryState createState() => _Withdraw_HistoryState();
}

// ignore: camel_case_types
class _Withdraw_HistoryState extends State<Withdraw_History> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  var datef = new DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 66, 71, 112),
        ),
        body: Column(
          //scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25 * SizeConfig.heightMultiplier),
              child: Container(
                  height: 40 * SizeConfig.heightMultiplier,
                  width: 320 * SizeConfig.heightMultiplier,
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
                child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return getList(widget.data[index]);
              },
            )),
          ],
        ));
  }

  Widget getList(WithdrawHistory data) {
    print('getList');
    return Padding(
      padding: EdgeInsets.only(
        top: 25 * SizeConfig.heightMultiplier,
        left: 35 * SizeConfig.widthMultiplier,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Withdrawal No: ${data.request_number}",
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Date: " + data.date.substring(0, 10),
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 14,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 17 * SizeConfig.widthMultiplier),
            child: Text(
              curf.format(data.total_amount) + ' INR',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff8c2f0f),
                fontSize: 15 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
