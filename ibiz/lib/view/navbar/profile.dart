import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  String full_name = 'Jenil',
      phone_number = '8758560666',
      email,
      home_address,
      city,
      zipconde;
  List<String> _states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];
  String _selectedLocation;
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 40 * SizeConfig.heightMultiplier,
                          left: 30 * SizeConfig.widthMultiplier,
                          right: 129 * SizeConfig.widthMultiplier,
                          bottom: 40 * SizeConfig.heightMultiplier),
                      child: SizedBox(
                        width: 107 * SizeConfig.widthMultiplier,
                        height: 40 * SizeConfig.heightMultiplier,
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            color: Color(0xff282828),
                            fontSize: 24 * SizeConfig.textMultiplier,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 11 * SizeConfig.heightMultiplier),
                          child: SizedBox(
                            height: 60 * SizeConfig.heightMultiplier,
                            width: 60 * SizeConfig.widthMultiplier,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/icons/user_icon.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: SizedBox(
                            height: 20 * SizeConfig.heightMultiplier,
                            width: 100 * SizeConfig.widthMultiplier,
                            child: FlatButton(
                              onPressed: null,
                              child: Text(
                                "Edit photo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff838587),
                                  fontSize: 13 * SizeConfig.textMultiplier,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 45 * SizeConfig.widthMultiplier,
                      right: 50 * SizeConfig.widthMultiplier),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Full Name*",
                            style: TextStyle(
                              color: Color(0xff838587),
                              fontSize: 13 * SizeConfig.textMultiplier,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: SizedBox(
                            child: TextFormField(
                              initialValue: full_name,
                              enabled: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 28.5 * SizeConfig.heightMultiplier),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number*",
                              style: TextStyle(
                                color: Color(0xff838587),
                                fontSize: 13 * SizeConfig.textMultiplier,
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
                              initialValue: phone_number,
                              enabled: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 28.5 * SizeConfig.heightMultiplier),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email Address*",
                              style: TextStyle(
                                color: Color(0xff838587),
                                fontSize: 13 * SizeConfig.textMultiplier,
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
                              keyboardType: TextInputType.emailAddress,
                              initialValue: email,
                              validator: (value) {
                                bool validEmail = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!validEmail) {
                                  return "Invalid Email";
                                }
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 28.5 * SizeConfig.heightMultiplier),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Home Address*",
                              style: TextStyle(
                                color: Color(0xff838587),
                                fontSize: 13 * SizeConfig.textMultiplier,
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
                              initialValue: home_address,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 28.5 * SizeConfig.heightMultiplier,
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "City*                                         Zipcode*",
                                    style: TextStyle(
                                      color: Color(0xff838587),
                                      fontSize: 13 * SizeConfig.textMultiplier,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 35 * SizeConfig.widthMultiplier),
                                child: SizedBox(
                                  width: 120 * SizeConfig.widthMultiplier,
                                  child: TextFormField(
                                    initialValue: city,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Enter City";
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120 * SizeConfig.widthMultiplier,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  initialValue: zipconde,
                                  validator: (value) {
                                    bool validZipcode =
                                        RegExp("[0-9][0-9][0-9][0-9][0-9][0-9]")
                                            .hasMatch(value);
                                    if (!validZipcode) {
                                      return "Invalid Zipcode";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 28.5 * SizeConfig.heightMultiplier),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "State*",
                              style: TextStyle(
                                color: Color(0xff838587),
                                fontSize: 13 * SizeConfig.textMultiplier,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 3.5 * SizeConfig.heightMultiplier,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: DropdownButton(
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                              items: _states.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    location,
                                    style: TextStyle(
                                      color: Color(0xff151515),
                                      fontSize: 15,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: (40) * SizeConfig.heightMultiplier,
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
                                  print('Full name: ' + this.full_name);
                                  print('Phone Number: ' + this.phone_number);
                                  print('Email: ' + this.email);
                                  print('Home Address: ' + this.home_address);
                                  print('City: ' + this.city);
                                  print('Zipcode: ' + this.zipconde);
                                  print('State: ' + this._selectedLocation);
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
                        ),
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
