import 'package:flutter/material.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/tokendb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/buysheet.dart';
import 'package:ibiz/view/bottom/HomeTab/chart.dart';
import 'package:ibiz/view/bottom/HomeTab/tokenlist.dart';
import 'package:ibiz/view/bottom/HomeTab/sellsheet.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Hometab extends StatefulWidget {
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    Future<List<Token>> tokenList = TokenDb().getToken();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(height: 1200 * SizeConfig.heightMultiplier),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 154,
                      child: Column(children: <Widget>[
                        FutureBuilder(
                            future: tokenList,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                Token latestToken = snapshot.data[0];
                                return Text(curf.format(latestToken.tokenPrice),
                                    style: TextStyle(
                                        fontSize:
                                            30 * SizeConfig.heightMultiplier,
                                        fontFamily: "Roboto",
                                        color: Colors.white));
                              } else {
                                return Text(curf.format(0),
                                    style: TextStyle(
                                        fontSize:
                                            30 * SizeConfig.heightMultiplier,
                                        fontFamily: "Roboto",
                                        color: Colors.white));
                              }
                            }),
                        Text('+15.00 (0.1%) This month',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 212, 31),
                                fontSize: 16 * SizeConfig.heightMultiplier))
                      ]),
                      color: Color.fromARGB(255, 66, 71, 112)),
                ],
              ),
            ),
            Positioned(
                top: 66 * SizeConfig.heightMultiplier,
                left: 12 * SizeConfig.widthMultiplier,
                right: 12 * SizeConfig.widthMultiplier,
                child: Column(children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      //height: 280 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 14 * SizeConfig.widthMultiplier),
                            child: ListTile(
                              leading: FutureBuilder(
                                  future: tokenList,
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      Token latestToken = snapshot.data[0];
                                      return Text(
                                          curf.format(latestToken.tokenPrice),
                                          style:
                                              TextStyle(color: Colors.green));
                                    } else {
                                      return Text(curf.format(0),
                                          style:
                                              TextStyle(color: Colors.green));
                                    }
                                  }),
                              trailing: Text(
                                  DateTime.now().toString().substring(0, 11)),
                            )),
                        Chart(),
                        SizedBox(height: 20 * SizeConfig.heightMultiplier)
                      ]),
                    ),
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 240 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 24 * SizeConfig.heightMultiplier,
                              left: 21 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Your Position',
                                style: TextStyle(
                                  fontSize: 20 * SizeConfig.heightMultiplier,
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25 * SizeConfig.widthMultiplier,
                              right: 25 * SizeConfig.widthMultiplier,
                              top: 30 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                        'NO OF TOKENS',
                                        style: TextStyle(
                                            fontSize: 15 *
                                                SizeConfig.heightMultiplier,
                                            color: Color.fromARGB(
                                                255, 114, 144, 144)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7 *
                                                SizeConfig.heightMultiplier),
                                        child: Text(
                                          userModel.tokens.toString() +
                                              '          ',
                                          style: TextStyle(
                                              fontSize: 25 *
                                                  SizeConfig.heightMultiplier),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'TOTAL DIVIDEND   ',
                                    style: TextStyle(
                                        fontSize:
                                            15 * SizeConfig.heightMultiplier,
                                        color:
                                            Color.fromARGB(255, 114, 144, 144)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 7 * SizeConfig.heightMultiplier),
                                    child: Text(
                                      curf.format(55650.25),
                                      style: TextStyle(
                                          fontSize:
                                              25 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25 * SizeConfig.widthMultiplier,
                              right: 25 * SizeConfig.widthMultiplier,
                              top: 20 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                        'PRICE PER TOCKEN',
                                        style: TextStyle(
                                            fontSize: 15 *
                                                SizeConfig.heightMultiplier,
                                            color: Color.fromARGB(
                                                255, 114, 144, 144)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7 *
                                                SizeConfig.heightMultiplier),
                                        child: FutureBuilder(
                                            future: tokenList,
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                Token latestToken =
                                                    snapshot.data[0];
                                                return Text(
                                                  curf.format(
                                                      latestToken.tokenPrice),
                                                  style: TextStyle(
                                                      fontSize: 25 *
                                                          SizeConfig
                                                              .heightMultiplier),
                                                );
                                              } else {
                                                return Text(curf.format(0),
                                                    style: TextStyle(
                                                        fontSize: 25 *
                                                            SizeConfig
                                                                .heightMultiplier));
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'TOTAL RETURN     ',
                                    style: TextStyle(
                                        fontSize:
                                            15 * SizeConfig.heightMultiplier,
                                        color:
                                            Color.fromARGB(255, 114, 144, 144)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 7 * SizeConfig.heightMultiplier),
                                    child: Text(
                                      '4.05%           ',
                                      style: TextStyle(
                                          fontSize:
                                              25 * SizeConfig.heightMultiplier),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  FutureBuilder(
                    future: tokenList,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13)),
                            height: 80 * SizeConfig.heightMultiplier,
                            width: 350 * SizeConfig.widthMultiplier,
                            child: Card(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15 * SizeConfig.heightMultiplier,
                                        left: 25 * SizeConfig.widthMultiplier,
                                        right: 20 * SizeConfig.widthMultiplier,
                                        bottom:
                                            15 * SizeConfig.heightMultiplier),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height:
                                            45 * SizeConfig.heightMultiplier,
                                        width: 140 * SizeConfig.widthMultiplier,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            Token token = snapshot.data[0];
                                            double price = token.tokenPrice;
                                            showBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return BuySheet(
                                                      tokenPrice: price);
                                                });
                                          },
                                          color:
                                              Color.fromARGB(255, 66, 71, 112),
                                          child: Text(
                                            'Buy',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 15 * SizeConfig.heightMultiplier,
                                        bottom:
                                            15 * SizeConfig.heightMultiplier),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height:
                                            45 * SizeConfig.heightMultiplier,
                                        width: 140 * SizeConfig.widthMultiplier,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            Token token = snapshot.data[0];
                                            double price = token.tokenPrice;
                                            showBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return SellSheet(
                                                      tokenPrice: price);
                                                });
                                          },
                                          color:
                                              Color.fromARGB(255, 66, 71, 112),
                                          child: Text(
                                            'Sell',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Card(
                    child: Container(
                      height: 411 * SizeConfig.heightMultiplier,
                      width: 350 * SizeConfig.widthMultiplier,
                      child: Column(children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20 * SizeConfig.widthMultiplier,
                                  top: 20 * SizeConfig.heightMultiplier),
                              child: Text(
                                "Profit History",
                                style: TextStyle(
                                    fontSize: 20 * SizeConfig.heightMultiplier),
                              ),
                            )),
                        Expanded(
                            child: Container(
                          height: 411 * SizeConfig.heightMultiplier,
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: tokenList,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ChangeNotifierProvider.value(
                                      value: userModel,
                                      child: Container(
                                          child: SingleChildScrollView(
                                              child: Column(
                                        children: [
                                          TokenList(data: snapshot.data),
                                          SizedBox(
                                              height: 200 *
                                                  SizeConfig.heightMultiplier)
                                        ],
                                      ))));
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        ))
                      ]),
                    ),
                  ),
                ])),
          ],
        ),
      ),
    );
  }

  // showBuyBottomSheet() {
  //   showBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return BuySheet();
  //       });
  // }

  // showSellBottomSheet() {
  //   showBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return SellSheet();
  //       });
  // }
}
