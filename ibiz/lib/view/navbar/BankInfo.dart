import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class BankInfo extends StatefulWidget {
  @override
  _BankInfoState createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  String upi_id = 'helloworld@oksbi',
      account_number = '36963349596',
      account_holder_name = 'Jenil Chandibhamar',
      ifsc_code = 'SBIN0060071';
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
                      top: 38 * SizeConfig.heightMultiplier,
                      left: 30 * SizeConfig.widthMultiplier,
                      right: 100 * SizeConfig.widthMultiplier,
                      bottom: 35 * SizeConfig.heightMultiplier),
                  child: SizedBox(
                    width: 200 * SizeConfig.widthMultiplier,
                    height: 40 * SizeConfig.heightMultiplier,
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
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 40 * SizeConfig.widthMultiplier,
                            right: 149.82 * SizeConfig.widthMultiplier),
                        child: SizedBox(
                          width: 178.18 * SizeConfig.widthMultiplier,
                          height: 30 * SizeConfig.heightMultiplier,
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
                          width: 280 * SizeConfig.widthMultiplier,
                          child: TextFormField(
                            initialValue: upi_id,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15 * SizeConfig.heightMultiplier,
                            left: 40 * SizeConfig.widthMultiplier,
                            right: 149.82 * SizeConfig.widthMultiplier),
                        child: SizedBox(
                          width: 178.18,
                          height: 30,
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
                          width: 280 * SizeConfig.widthMultiplier,
                          child: TextFormField(
                            initialValue: account_number,
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
                            top: 15 * SizeConfig.heightMultiplier,
                            left: 40 * SizeConfig.widthMultiplier,
                            right: 149.82 * SizeConfig.widthMultiplier),
                        child: SizedBox(
                          width: 178.18,
                          height: 30,
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
                          width: 280 * SizeConfig.widthMultiplier,
                          child: TextFormField(
                            initialValue: account_holder_name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Account Holder Name";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15 * SizeConfig.heightMultiplier,
                            left: 40 * SizeConfig.widthMultiplier,
                            right: 149.82 * SizeConfig.widthMultiplier),
                        child: SizedBox(
                          width: 178.18,
                          height: 30,
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
                          width: 280 * SizeConfig.widthMultiplier,
                          child: TextFormField(
                            initialValue: ifsc_code,
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
                              onPressed: () {
                                if (_signUpFormKey.currentState.validate()) {
                                  setState(() {});
                                }
                                print('Bank UPI: ' + this.upi_id);
                                print('Account Number: ' + this.account_number);
                                print('Account Holder Name: ' +
                                    this.account_holder_name);
                                print('IFSC code: ' + this.ifsc_code);
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
