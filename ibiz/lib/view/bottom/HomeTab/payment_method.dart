import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/buytoken.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/complete_order.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  final int amount, tokens;
  final UserModel userModel;
  PaymentMethod({this.amount, this.userModel, this.tokens});
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  int b = 0;
  String paymentMethodUsed;

  void f1(int a) {
    setState(() {
      b = a;
    });
  }

  void f2() {
    if (b == 1) {
      paymentMethodUsed = "Account Balance";
    }
    if (b == 2) {
      this.paymentMethodUsed = "Online Paymnet";
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 14),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 25 * SizeConfig.widthMultiplier),
                  child: Text(
                    "Payable amount: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(21, 21, 21, 1),
                      fontSize: (15) * SizeConfig.heightMultiplier,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 70 * SizeConfig.widthMultiplier),
                  child: Text(
                    curf.format(widget.amount),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(140, 47, 15, 1),
                      fontSize: (18) * SizeConfig.heightMultiplier,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 25 * SizeConfig.heightMultiplier,
                left: 25 * SizeConfig.widthMultiplier),
            child: Text(
              "Select a Payment method : ",
              style: TextStyle(
                color: Color.fromRGBO(21, 21, 21, 1),
                fontSize: (18) * SizeConfig.heightMultiplier,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20 * SizeConfig.heightMultiplier),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                  child: Radio(
                    value: 1,
                    groupValue: b,
                    onChanged: (v) {
                      f1(v);
                    },
                    activeColor: Color.fromRGBO(255, 212, 31, 1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 14 * SizeConfig.widthMultiplier, top: 15),
                  child: Text(
                    "Use account balance.\n" +
                        "Available balance  " +
                        curf.format(userModel.acc_bal) +
                        " ) ",
                    style: TextStyle(
                      color: Color.fromRGBO(21, 21, 21, 1),
                      fontSize: (15) * SizeConfig.heightMultiplier,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                  child: Radio(
                    value: 2,
                    groupValue: b,
                    onChanged: (v) {
                      f1(v);
                    },
                    activeColor: Color.fromRGBO(255, 212, 31, 1),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 14 * SizeConfig.widthMultiplier),
                  child: Text(
                    "Online Payment",
                    style: TextStyle(
                      color: Color.fromRGBO(21, 21, 21, 1),
                      fontSize: (15) * SizeConfig.heightMultiplier,
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
                top: (40) * SizeConfig.heightMultiplier,
                left: (17) * SizeConfig.widthMultiplier,
                right: (18) * SizeConfig.widthMultiplier),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular((5) * SizeConfig.heightMultiplier),
              child: Container(
                width: (340) * SizeConfig.widthMultiplier,
                height: (45) * SizeConfig.heightMultiplier,
                child: RaisedButton(
                  onPressed: () async {
                    f2();
                    if (this.paymentMethodUsed == 'Account Balance') {
                      UserModel userDataModel = await Userdb()
                          .getUserByMobileNo(widget.userModel.mobileNo);
                      if (userDataModel.acc_bal >= widget.amount) {
                        bool res = await BuyToken().buyToken(
                            id: userDataModel.id,
                            newBal: userDataModel.acc_bal - widget.amount,
                            newToken: userDataModel.tokens + widget.tokens);
                        if (res) {
                          userModel.updateTokenAndBal(
                              newToken: userModel.tokens + widget.tokens,
                              newBal: userModel.acc_bal - widget.amount);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CompleteOrder()));
                        }
                      } else {
                        print('Insufficient Balance');
                      }
                    } else if (this.paymentMethodUsed == 'Online Paymnet') {}
                  },
                  color: Color.fromRGBO(255, 212, 31, 1),
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                        color: Color.fromRGBO(21, 21, 21, 1),
                        fontWeight: FontWeight.normal,
                        fontSize: (15) * SizeConfig.heightMultiplier),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
