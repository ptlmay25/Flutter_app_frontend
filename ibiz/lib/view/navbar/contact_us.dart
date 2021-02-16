import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/contactusdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:provider/provider.dart';

class Contact_Us extends StatefulWidget {
  @override
  _Contact_UsState createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  String fullName, accNo, email, message;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      left: 30 * SizeConfig.widthMultiplier,
                      bottom: 20 * SizeConfig.heightMultiplier,
                      top: 49 * SizeConfig.heightMultiplier),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Get in touch",
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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Full Name",
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
                              onSaved: (value) {
                                setState(() {
                                  this.fullName = value;
                                });
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
                              "Account Number",
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
                              initialValue: userModel.bankAccountNo,
                              onSaved: (value) {
                                setState(() {
                                  this.accNo = value;
                                });
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
                              "Email Address*",
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
                              initialValue: userModel.email,
                              onSaved: (value) {
                                setState(() {
                                  this.email = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Email Address";
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
                              "Message*",
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
                          padding: EdgeInsets.only(
                              top: 15 * SizeConfig.heightMultiplier),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
                              maxLines: null,
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  this.message = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Message";
                                }
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: (35) * SizeConfig.heightMultiplier,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                (5) * SizeConfig.heightMultiplier),
                            child: Container(
                              height: (40) * SizeConfig.heightMultiplier,
                              width: (160) * SizeConfig.widthMultiplier,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    var res = await ContactUsDb().contact(
                                        userId: userModel.id,
                                        name: fullName,
                                        message: message,
                                        accNo: accNo,
                                        email: email);
                                    if (res == true) {
                                      Fluttertoast.showToast(
                                          msg: "Message Sent",
                                          timeInSecForIosWeb: 4);
                                      print("Message Sent");
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Internal error accoured",
                                          timeInSecForIosWeb: 4);
                                    }
                                  }
                                },
                                color: Color.fromARGB(255, 66, 71, 112),
                                child: Text(
                                  'Send',
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
