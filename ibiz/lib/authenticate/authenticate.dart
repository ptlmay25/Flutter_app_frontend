import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 200, left: 100, right: 100, bottom: 100),
            child: Text(
              "App Name",
              style: TextStyle(fontSize: 36, fontStyle: FontStyle.normal, color: Color.fromRGBO(21, 21, 21, 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    onPressed: () {
                      print("Login Pressed");
                    },
                    child: Text("Log in"),
                    color: Color.fromRGBO(21, 21, 21, 50),
                    textColor: Colors.white,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RaisedButton(
                    onPressed: () {
                      print("SignUp Pressed");
                    },
                    child: Text("Sign Up"),
                    textColor: Colors.white,
                    color: Color.fromRGBO(21, 21, 21, 50),
                  ),
                ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
