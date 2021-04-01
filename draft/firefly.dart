import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/getStarted.dart';
import 'package:ibiz/authScreen/welcome.dart';
import 'package:ibiz/size_config.dart';

class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 18.3 * SizeConfig.heightMultiplier,
                left: 30.6 * SizeConfig.widthMultiplier,
                right: 30.6 * SizeConfig.widthMultiplier,
                bottom: 60.6 * SizeConfig.heightMultiplier),
            child: Text(
              "FIREFLY",
              style: TextStyle(
                  fontSize: 4.3 * SizeConfig.heightMultiplier,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(21, 21, 21, 50)),
            ),
          ), //FireflyText
          Padding(
            padding: EdgeInsets.only(
                left: 7.6 * SizeConfig.widthMultiplier,
                right: 7.6 * SizeConfig.widthMultiplier),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 4.7 * SizeConfig.heightMultiplier,
                      width: 76.53 * SizeConfig.widthMultiplier,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Welcome()));
                        },
                        color: Color.fromARGB(255, 21, 21, 21),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 2.3 * SizeConfig.heightMultiplier),
                        ),
                      ),
                    ),
                  ),
                ), //LogInButton
                SizedBox(width: 5.1 * SizeConfig.widthMultiplier),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 4.7 * SizeConfig.heightMultiplier,
                      width: 76.53 * SizeConfig.widthMultiplier,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GetStarted()));
                        },
                        color: Color.fromARGB(255, 21, 21, 21),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 2.3 * SizeConfig.heightMultiplier),
                        ),
                      ),
                    ),
                  ),
                ) //SignUpButton
              ],
            ),
          )
        ],
      )),
    );
  }
}
