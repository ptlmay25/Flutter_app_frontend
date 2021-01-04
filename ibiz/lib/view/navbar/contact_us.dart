import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class Contact_Us extends StatefulWidget {
  @override
  _Contact_UsState createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
    String Name = 'Nishidh Patel',
        Account_number = '11000501',
        Email = "",
        Message = "";
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
                    key: _signUpFormKey,
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
                              initialValue: Name,
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
                              initialValue: Account_number,
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
                              initialValue: Email,
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
                              initialValue: Message,
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
                                onPressed: () {
                                  if (_signUpFormKey.currentState.validate()) {
                                    setState(() {});
                                  }
                                  print('Name: ' + Name);
                                  print('Account Number: ' + Account_number);
                                  print('Email: ' + Email);
                                  print('Message: ' + Message);
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
