import 'package:flutter/material.dart';
import 'package:ibiz/authScreen/getStarted.dart';
import 'package:ibiz/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Earn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: Color(0xff151515),
                  fontSize: 32 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.w400,
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
              'assets/images/Group.png',
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
                  color: Color.fromARGB(255, 66,71,112),
                  child: Text(
                    'Get Stared',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
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
