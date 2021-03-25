import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';
import 'package:lottie/lottie.dart';

class CompleteOrder extends StatefulWidget {
  final String message;
  final bool flag;
  CompleteOrder({this.message, this.flag});
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
            child: Column(
              children: [
                Lottie.asset('assets/check_mark.json', repeat: false),
              ],
            ),
          ),
          SizedBox(
            height: 50 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.only(top: 19 * SizeConfig.heightMultiplier),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(21, 21, 21, 1),
                fontSize: (16) * SizeConfig.heightMultiplier,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 50 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.only(
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
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
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
          ),
          (widget.flag)
              ? Padding(
                  padding: EdgeInsets.only(
                    right: 20 * SizeConfig.widthMultiplier,
                    left: 28 * SizeConfig.widthMultiplier,
                    top: 245 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    child: Text(
                      'Note:- After requesting a withdraw. It takes up to 24 hours to process the amount. Once the request is processed, The amount will be credited to your given bank account number.',
                      style:
                          TextStyle(fontSize: 11 * SizeConfig.heightMultiplier),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
