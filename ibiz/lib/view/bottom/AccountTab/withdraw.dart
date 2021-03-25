import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/withdrawrequest.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/complete_order.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Withdraw extends StatefulWidget {
  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var curf = new NumberFormat.currency(locale: "en_IN", symbol: "₹ ");
  String name, accNo, IFSC, UPI;
  int amount;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 66, 71, 112),

        // toolbarHeight: 50 * SizeConfig.heightMultiplier,
      ),
      body: ListView(
        children: [
          Container(
            height: 64 * SizeConfig.heightMultiplier,
            color: Color.fromARGB(255, 66, 71, 112),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    curf.format(userModel.acc_bal),
                    style: TextStyle(
                        fontSize: 28 * SizeConfig.heightMultiplier,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Text(
                    'Available balance for withdrawal',
                    style: TextStyle(
                        fontSize: 11 * SizeConfig.heightMultiplier,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 40 * SizeConfig.heightMultiplier,
                left: 28 * SizeConfig.widthMultiplier,
                right: 28 * SizeConfig.widthMultiplier),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Bank Account Number',
                        style: TextStyle(
                            fontSize: 11 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    initialValue: userModel.bankAccountNo,
                    onSaved: (value) {
                      setState(() {
                        this.accNo = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "field is empty";
                      }
                    },
                  ),
                  SizedBox(height: 40 * SizeConfig.heightMultiplier),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Account Holder’s Name',
                        style: TextStyle(
                            fontSize: 11 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    initialValue: userModel.username,
                    onSaved: (value) {
                      setState(() {
                        this.name = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "field is empty";
                      }
                    },
                  ),
                  SizedBox(height: 40 * SizeConfig.heightMultiplier),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('IFSC Code',
                        style: TextStyle(
                            fontSize: 11 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    initialValue: userModel.IFSC,
                    onSaved: (value) {
                      setState(() {
                        this.IFSC = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "field is empty";
                      }
                    },
                  ),
                  SizedBox(height: 40 * SizeConfig.heightMultiplier),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('UPI',
                        style: TextStyle(
                            fontSize: 11 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: '*optional'),
                    initialValue: userModel.UPI,
                    onSaved: (value) {
                      setState(() {
                        this.UPI = value;
                      });
                    },
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return "field is empty";
                    //   }
                    // },
                  ),
                  SizedBox(height: 40 * SizeConfig.heightMultiplier),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Amount (₹)',
                        style: TextStyle(
                            fontSize: 11 * SizeConfig.heightMultiplier,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      setState(() {
                        this.amount = int.parse(value);
                      });
                    },
                    validator: (value) {
                      bool isValid = RegExp("[0-9]+").hasMatch(value);
                      if (!isValid) {
                        return 'Amount should be Number';
                      }
                    },
                  ),
                  SizedBox(height: 40 * SizeConfig.heightMultiplier),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 45 * SizeConfig.heightMultiplier,
                      width: 330 * SizeConfig.widthMultiplier,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            if (amount <= userModel.acc_bal) {
                              bool res = await WithdrawRequest().request(
                                  userId: userModel.id,
                                  IFSC: IFSC,
                                  UPI: UPI,
                                  accNo: accNo,
                                  amount: amount);
                              if (res) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CompleteOrder(
                                          message:
                                              'Your withdrawal request has\n been submitted',
                                          flag: true,
                                        )));
                                Fluttertoast.showToast(
                                    msg: "Request Sent", timeInSecForIosWeb: 4);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Internal Error",
                                    timeInSecForIosWeb: 4);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Insufficient Balance",
                                  timeInSecForIosWeb: 4);
                            }
                          }
                        },
                        color: Color.fromARGB(255, 255, 212, 31),
                        child: Text(
                          'Withdraw',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 15 * SizeConfig.heightMultiplier),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45 * SizeConfig.heightMultiplier),
                  Text(
                      'Note:- After requesting a withdraw. It takes up to 24 hours to process the amount. Once the request is processed, The amount will be credited to your given bank account number.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11 * SizeConfig.heightMultiplier))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
