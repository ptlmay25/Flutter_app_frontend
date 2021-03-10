import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/service/database/selltoken.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/view/bottom/HomeTab/complete_order.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SellSheet extends StatefulWidget {
  final double tokenPrice;
  SellSheet({this.tokenPrice});
  @override
  _SellSheetState createState() => _SellSheetState();
}

class _SellSheetState extends State<SellSheet> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  int _n = 1;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius:
            //     BorderRadius.circular(15 * SizeConfig.heightMultiplier),
            border: Border(top: BorderSide(width: 1, color: Colors.black))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.highlight_off),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text(
            userModel.tokens.toString(),
            style: TextStyle(fontSize: 50 * SizeConfig.heightMultiplier),
          ),
          SizedBox(height: 5 * SizeConfig.widthMultiplier),
          Text(
            'Price per unit: ₹ ${widget.tokenPrice}',
            style: TextStyle(
                fontSize: 15 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 45 * SizeConfig.heightMultiplier,
                left: 115 * SizeConfig.widthMultiplier),
            child: Row(
              children: [
                Text(
                  'unit: ',
                  style: TextStyle(
                      fontSize: 14 * SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  height: 35 * SizeConfig.heightMultiplier,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 35 * SizeConfig.heightMultiplier,
                            width: 35 * SizeConfig.widthMultiplier,
                            child: RaisedButton(
                              onPressed: () async {
                                setState(() {
                                  if (_n != 1) _n--;
                                });
                              },
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: Text('-'),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 35 * SizeConfig.widthMultiplier,
                            width: 35 * SizeConfig.widthMultiplier,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('$_n',
                                  style: new TextStyle(
                                      fontSize:
                                          18 * SizeConfig.widthMultiplier)),
                            )),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 35 * SizeConfig.heightMultiplier,
                            width: 35 * SizeConfig.widthMultiplier,
                            child: RaisedButton(
                              onPressed: () async {
                                setState(() {
                                  if (_n != userModel.tokens) _n++;
                                });
                              },
                              color: Color.fromARGB(255, 235, 235, 235),
                              child: Text('+'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50 * SizeConfig.heightMultiplier),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 45 * SizeConfig.heightMultiplier,
              width: 240 * SizeConfig.widthMultiplier,
              child: RaisedButton(
                onPressed: () async {
                  Map data = {"user_id": userModel.id, "num_of_tokens": _n};
                  Map body = {"data": data};
                  var res = await SellToken().sell(body: body);
                  if (res) {
                    print(res);
                    userModel.updateTokenAndBal(
                        newBal: userModel.acc_bal + _n * widget.tokenPrice,
                        newToken: userModel.tokens - _n,
                        newSell: userModel.total_sell + _n * widget.tokenPrice,
                        newPurchase: userModel.total_purchase);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CompleteOrder()));
                  }
                },
                color: Color.fromARGB(255, 66, 71, 112),
                child: Text(
                  'Sell',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16 * SizeConfig.heightMultiplier),
                ),
              ),
            ),
          ),
          SizedBox(height: 25 * SizeConfig.heightMultiplier),
          Text('Total: ₹ ${_n * widget.tokenPrice}'),
        ]),
      ),
    );
  }
}
