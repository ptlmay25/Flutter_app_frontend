import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';
import 'package:share/share.dart';

class Sharetab extends StatefulWidget {
  @override
  _SharetabState createState() => _SharetabState();
}

class _SharetabState extends State<Sharetab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120 * SizeConfig.heightMultiplier),
            child: Image.asset("assets/images/Share pic.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30 * SizeConfig.heightMultiplier),
            child: Text(
              "Invite Friends & Earn More",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100 * SizeConfig.heightMultiplier,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 40 * SizeConfig.heightMultiplier,
                width: 200 * SizeConfig.widthMultiplier,
                child: RaisedButton(
                  onPressed: () async {
                    Share.share("Welcome to Firefly Salers' Club: http://saler-club.surge.sh/ ");
                  },
                  color: Color.fromARGB(255, 66, 71, 112),
                  child: Text(
                    'Invite',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16 * SizeConfig.heightMultiplier),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
