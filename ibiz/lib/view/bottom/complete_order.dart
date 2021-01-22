import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class CompleteOrder extends StatefulWidget {
  @override
  _CompleteOrderState createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 138 * SizeConfig.widthMultiplier,
                right: 137 * SizeConfig.widthMultiplier,
                top: 116 * SizeConfig.heightMultiplier),
            child: Image.asset(
              "assets/icons/Vector.png",
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 19 * SizeConfig.heightMultiplier),
            child: Text(
              "Your order is complete",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(21, 21, 21, 1),
                fontSize: (16) * SizeConfig.heightMultiplier,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (50) * SizeConfig.heightMultiplier,
                left: (48) * SizeConfig.widthMultiplier,
                right: (47) * SizeConfig.widthMultiplier),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular((5) * SizeConfig.heightMultiplier),
              child: Container(
                width: (280) * SizeConfig.widthMultiplier,
                height: (45) * SizeConfig.heightMultiplier,
                child: RaisedButton(
                  onPressed: () {
                    // Go Back To Home
                  },
                  color: Color.fromRGBO(255, 212, 31, 1),
                  child: Text(
                    'Go back to home',
                    style: TextStyle(
                        color: Color.fromRGBO(21, 21, 21, 1),
                        fontWeight: FontWeight.normal,
                        fontSize: (15) * SizeConfig.heightMultiplier),
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
