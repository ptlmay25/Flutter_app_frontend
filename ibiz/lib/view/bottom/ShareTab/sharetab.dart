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
          SizedBox(height: 20 * SizeConfig.heightMultiplier),
          Padding(
            padding: EdgeInsets.only(
                left: 44 * SizeConfig.widthMultiplier,
                right: 31 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                Text('The more friends that joins, the more we grow.',
                    style: TextStyle(
                        fontSize: 13 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.w300)),
                Text('The more we grow, the more you earn.',
                    style: TextStyle(
                        fontSize: 13 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 40 * SizeConfig.heightMultiplier,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 40 * SizeConfig.heightMultiplier,
                width: 200 * SizeConfig.widthMultiplier,
                child: RaisedButton(
                  onPressed: () async {
                    Share.share(
                        "Start your own franchise business from home with Saler's club and earn up to ₹30,000/- a month.\nJoin saler's club today\nhttps://play.google.com/store/apps/details?id=com.firefly.ibiz");
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
