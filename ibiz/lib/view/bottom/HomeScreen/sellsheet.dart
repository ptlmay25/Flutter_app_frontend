import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/payment_method.dart';

class SellSheet extends StatefulWidget {
  @override
  _SellSheetState createState() => _SellSheetState();
}

class _SellSheetState extends State<SellSheet> {
  int _n = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * SizeConfig.heightMultiplier),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.highlight_off),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Text(
          '50',
          style: TextStyle(fontSize: 50 * SizeConfig.heightMultiplier),
        ),
        SizedBox(height: 5 * SizeConfig.widthMultiplier),
        Text(
          'Price per Token: 3550.00',
          style: TextStyle(
              fontSize: 15 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.w300),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 45 * SizeConfig.heightMultiplier,
              left: 98 * SizeConfig.widthMultiplier),
          child: Row(
            children: [
              Text(
                'Token: ',
                style: TextStyle(
                    fontSize: 14 * SizeConfig.heightMultiplier,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                height: 35 * SizeConfig.heightMultiplier,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 35 * SizeConfig.heightMultiplier,
                          width: 35 * SizeConfig.widthMultiplier,
                          child: RaisedButton(
                            onPressed: () async {
                              setState(() {
                                if (_n != 1) _n--;
                              });
                            },
                            color: Color.fromARGB(255, 235, 235, 235),
                            child: Text('-'),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 35 * SizeConfig.widthMultiplier,
                          width: 35 * SizeConfig.widthMultiplier,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('$_n',
                                style: new TextStyle(
                                    fontSize: 18 * SizeConfig.widthMultiplier)),
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 35 * SizeConfig.heightMultiplier,
                          width: 35 * SizeConfig.widthMultiplier,
                          child: RaisedButton(
                            onPressed: () async {
                              setState(() {
                                if (_n != 20) _n++;
                              });
                            },
                            color: Color.fromARGB(255, 235, 235, 235),
                            child: Text('+'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50 * SizeConfig.heightMultiplier),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 45 * SizeConfig.heightMultiplier,
            width: 240 * SizeConfig.widthMultiplier,
            child: RaisedButton(
              onPressed: () async {
                //TODO SELL
              },
              color: Color.fromARGB(255, 66, 71, 112),
              child: Text(
                'Sell',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16 * SizeConfig.heightMultiplier),
              ),
            ),
          ),
        ),
        SizedBox(height: 25 * SizeConfig.heightMultiplier),
        Text('Total: ₹ ${_n * 3550}'),
      ]),
    );
  }
}
