import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class Notification_Page extends StatefulWidget {
  @override
  _Notification_PageState createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 71, 112),
      ),
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 33 * SizeConfig.heightMultiplier,
                    left: 17 * SizeConfig.widthMultiplier,
                    right: 18 * SizeConfig.widthMultiplier),
                child: Container(
                  width: 340 * SizeConfig.widthMultiplier,
                  height: 100 * SizeConfig.heightMultiplier,
                  child: Container(
                    width: 340 * SizeConfig.widthMultiplier,
                    height: 100 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f151515),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 300 * SizeConfig.widthMultiplier,
                              height: 80 * SizeConfig.heightMultiplier,
                              child: Text(
                                "Your Withdrawal request No: W-1023569 has been processed. We have transferred the fund to your given bank account No. 1252463664552.",
                                style: TextStyle(
                                  color: Color(0xff151515),
                                  fontSize: 14 * SizeConfig.textMultiplier,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 265 * SizeConfig.widthMultiplier,
                          top: 79 * SizeConfig.heightMultiplier,
                          child: SizedBox(
                            width: 60 * SizeConfig.widthMultiplier,
                            height: 15 * SizeConfig.heightMultiplier,
                            child: Text(
                              "10th Dec",
                              style: TextStyle(
                                color: Color(0xff151515),
                                fontSize: 12 * SizeConfig.textMultiplier,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
