import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/getStarted.dart';
import 'package:ibiz/size_config.dart';

class Earn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 113 * SizeConfig.heightMultiplier),
            child: SizedBox(
              width: 320 * SizeConfig.widthMultiplier,
              height: 100 * SizeConfig.heightMultiplier,
              child: Text(
                "Earn Amazing \nRewards Every day",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1d224d),
                  fontSize: 28 * SizeConfig.heightMultiplier,
                ),
              ),
            ),
          ), //Text_Earn
          Padding(
            padding: EdgeInsets.only(
                top: 80 * SizeConfig.heightMultiplier,
                left: 17 * SizeConfig.widthMultiplier,
                right: 17 * SizeConfig.widthMultiplier),
            child: Image.asset(
              'assets/images/Group.jpg',
              fit: BoxFit.fill,
            ),
          ), //image
          Padding(
            padding: EdgeInsets.only(
                top: 100 * SizeConfig.heightMultiplier,
                left: 53 * SizeConfig.widthMultiplier,
                right: 53 * SizeConfig.widthMultiplier),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 45 * SizeConfig.heightMultiplier,
                width: 270 * SizeConfig.widthMultiplier,
                child: RaisedButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GetStarted()));
                  },
                  color: Color.fromARGB(255, 21, 21, 21),
                  child: Text(
                    'Get Stared',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * SizeConfig.heightMultiplier),
                  ),
                ),
              ),
            ),
          ), //GetStarted_Button
        ],
      ),
    );
  }
}
