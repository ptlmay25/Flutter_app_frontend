import 'package:flutter/material.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/size_config.dart';

class AddFund extends StatefulWidget {
  @override
  _AddFundState createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  double amount;
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 36 * SizeConfig.heightMultiplier,
                    left: 36 * SizeConfig.widthMultiplier),
                child: Text(
                  'Add Funds',
                  style: TextStyle(fontSize: 18 * SizeConfig.heightMultiplier),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: 38 * SizeConfig.heightMultiplier,
                left: 47 * SizeConfig.widthMultiplier,
                right: 47 * SizeConfig.widthMultiplier),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Amount'),
                    onSaved: (value) {
                      setState(() {
                        this.amount = double.parse(value);
                      });
                    },
                    validator: (value) {
                      bool isValid = RegExp("[0-9]+").hasMatch(value);
                      if (!isValid) {
                        return 'Amount should be Number';
                      }
                    },
                  ),
                  SizedBox(height: 30 * SizeConfig.heightMultiplier),
                  TextFormField(
                    initialValue: userModel.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email Address*'),
                    onSaved: (value) {
                      setState(() {
                        this.email = value;
                      });
                    },
                    validator: (value) {
                      bool validEmail = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!validEmail) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  SizedBox(height: 30 * SizeConfig.heightMultiplier),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Phone Number*'),
                    initialValue: userModel.mobileNo,
                    enabled: false,
                  ),
                  SizedBox(height: 75 * SizeConfig.heightMultiplier),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 40 * SizeConfig.heightMultiplier,
                        width: 300 * SizeConfig.widthMultiplier,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print('$email $amount ${userModel.mobileNo}');
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (context) => GetStarted()));
                            }
                          },
                          color: Color.fromARGB(255, 66, 71, 112),
                          child: Text(
                            'Add ( amount )',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16 * SizeConfig.heightMultiplier),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
