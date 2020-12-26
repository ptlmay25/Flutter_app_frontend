import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/getStarted.dart';
import 'package:ibiz/authScreen/welcome.dart';

class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 200, left: 100, right: 100, bottom: 100),
            child: Text(
              "FIREFLY",
              style: TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(21, 21, 21, 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 40,
                      width: 300,
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
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 40,
                      width: 300,
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
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
