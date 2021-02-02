import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:provider/provider.dart';

class BankInfo extends StatefulWidget {
  BankInfo();
  @override
  _BankInfoState createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  final GlobalKey<FormState> _bankFormKey = GlobalKey<FormState>();
  String UPI, bankAccountNo, username, IFSC;
  bool isUpdated = false;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
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
                showAlert(),
                Padding(
                  padding: EdgeInsets.only(
                      top: 38 * SizeConfig.heightMultiplier,
                      left: 30 * SizeConfig.widthMultiplier,
                      right: 100 * SizeConfig.widthMultiplier,
                      bottom: 35 * SizeConfig.heightMultiplier),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bank Account Details",
                      style: TextStyle(
                        color: Color(0xff282828),
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 40 * SizeConfig.widthMultiplier,
                        right: 50 * SizeConfig.widthMultiplier),
                    child: Form(
                      key: _bankFormKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Bank UPI",
                                style: TextStyle(
                                  color: Color(0xff838587),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: SizedBox(
                              child: TextFormField(
                                onSaved: (value) {
                                  setState(() {
                                    this.UPI = value;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Bank UPI";
                                  }
                                },
                                initialValue: userModel.UPI,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15 * SizeConfig.heightMultiplier),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Bank Account Number*",
                                style: TextStyle(
                                  color: Color(0xff838587),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: SizedBox(
                              child: TextFormField(
                                initialValue: userModel.bankAccountNo,
                                onSaved: (value) {
                                  setState(() {
                                    this.bankAccountNo = value;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Account Number";
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15 * SizeConfig.heightMultiplier),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Account Holder Name*",
                                style: TextStyle(
                                  color: Color(0xff838587),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: SizedBox(
                              child: TextFormField(
                                enabled: false,
                                initialValue: userModel.username,
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "Please Enter Account Holder Name";
                                //   }
                                // },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15 * SizeConfig.heightMultiplier),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "IFSC Code*",
                                style: TextStyle(
                                  color: Color(0xff838587),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: SizedBox(
                              child: TextFormField(
                                initialValue: userModel.IFSC,
                                onSaved: (value) {
                                  setState(() {
                                    this.IFSC = value;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter IFSC Code";
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (50) * SizeConfig.heightMultiplier,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  (5) * SizeConfig.heightMultiplier),
                              child: Container(
                                height: (40) * SizeConfig.heightMultiplier,
                                width: (160) * SizeConfig.widthMultiplier,
                                child: RaisedButton(
                                  onPressed: () async {
                                    if (_bankFormKey.currentState.validate()) {
                                      _bankFormKey.currentState.save();
                                      bool res = await Userdb()
                                          .updateUserBankDetails(userModel.id,
                                              UPI, bankAccountNo, IFSC);
                                      if (res == true) {
                                        setState(() {
                                          this.isUpdated = true;
                                        });
                                        print("BankDetails Updated");
                                        userModel.updateBankDetails(
                                            newAccNo: bankAccountNo,
                                            newUpi: UPI,
                                            newIfsc: IFSC);
                                      }
                                    }
                                  },
                                  color: Color.fromARGB(255, 66, 71, 112),
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            (16) * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showAlert() {
    if (this.isUpdated == false) {
      return Container();
    } else {
      return SizedBox(
        child: Container(
          color: Colors.amber,
          child: ListTile(
            leading: Icon(Icons.error_outline),
            title: Text("Bank Details Updated"),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    this.isUpdated = false;
                  });
                },
                icon: Icon(Icons.close)),
          ),
        ),
      );
    }
  }
}
