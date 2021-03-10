import 'package:flutter/material.dart';
import 'package:ibiz/models/purchase.dart';
import 'package:ibiz/models/sell.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/purchasedb.dart';
import 'package:ibiz/service/database/selldb.dart';
import 'package:ibiz/service/database/tokendb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/buysheet.dart';
import 'package:ibiz/view/bottom/HomeTab/chart.dart';
import 'package:ibiz/view/bottom/HomeTab/sellsheet.dart';
import 'package:ibiz/view/bottom/HomeTab/tokentile.dart';
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
    Future<List<Purchase>> purchaseList =
        PurchaseDb().getPurchase(id: userModel.id);
    Future<List<Sell>> sellList = SellDb().getSell(id: userModel.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(height: 695 * SizeConfig.heightMultiplier),
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
                                future: Future.wait(
                                    [purchaseList, sellList, tokenList]),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    Token latestToken = snapshot.data[2][0];
                                    Map data = getPurchaseSellDetails(
                                        snapshot.data[0], snapshot.data[1]);
                                    double estPurchase = data['estPurchase'];
                                    double estProfit = (latestToken.tokenPrice -
                                            estPurchase / userModel.tokens) *
                                        userModel.tokens;
                                    return Text(
                                        curf.format(((estPurchase + estProfit)
                                            .toDouble())),
                                        style: TextStyle(
                                            fontSize: 30 *
                                                SizeConfig.heightMultiplier,
                                            fontFamily: "Roboto",
                                            color: Colors.white));
                                  } else {
                                    return Text(curf.format(0),
                                        style: TextStyle(
                                            fontSize: 30 *
                                                SizeConfig.heightMultiplier,
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
                          height: 290 * SizeConfig.heightMultiplier,
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
                                              curf.format(
                                                  latestToken.tokenPrice),
                                              style: TextStyle(
                                                  color: Colors.green));
                                        } else {
                                          return Text(curf.format(0),
                                              style: TextStyle(
                                                  color: Colors.green));
                                        }
                                      }),
                                  trailing: Text(DateTime.now()
                                      .toString()
                                      .substring(0, 11)),
                                )),
                            SizedBox(height: 35 * SizeConfig.heightMultiplier),
                            FutureBuilder(
                              future: tokenList,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Chart(tokenList: snapshot.data);
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
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
                                      fontSize:
                                          20 * SizeConfig.heightMultiplier,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25 * SizeConfig.widthMultiplier,
                                  right: 10 * SizeConfig.widthMultiplier,
                                  top: 30 * SizeConfig.heightMultiplier),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'NO OF TOKENS',
                                              style: TextStyle(
                                                  fontSize: 15 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  color: Color.fromARGB(
                                                      255, 114, 144, 144)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 7 *
                                                      SizeConfig
                                                          .heightMultiplier),
                                              child: Text(
                                                userModel.tokens.toString(),
                                                style: TextStyle(
                                                    fontSize: 25 *
                                                        SizeConfig
                                                            .heightMultiplier),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 140 * SizeConfig.widthMultiplier,
                                    height: 60 * SizeConfig.heightMultiplier,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'EST. PROFIT',
                                            style: TextStyle(
                                                fontSize: 15 *
                                                    SizeConfig.heightMultiplier,
                                                color: Color.fromARGB(
                                                    255, 114, 144, 144)),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 7 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            child: FutureBuilder(
                                                future: Future.wait([
                                                  purchaseList,
                                                  sellList,
                                                  tokenList
                                                ]),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData &&
                                                      userModel.tokens > 0) {
                                                    Token token =
                                                        snapshot.data[2][0];
                                                    Map data =
                                                        getPurchaseSellDetails(
                                                            snapshot.data[0],
                                                            snapshot.data[1]);
                                                    double estPurchase =
                                                        data['estPurchase'];
                                                    double estProfit = (token
                                                                .tokenPrice -
                                                            estPurchase /
                                                                userModel
                                                                    .tokens) *
                                                        userModel.tokens;
                                                    return Text(
                                                      curf.format(
                                                          estProfit.abs()),
                                                      style: TextStyle(
                                                          fontSize: 25 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  } else {
                                                    return Text(
                                                      curf.format(0),
                                                      style: TextStyle(
                                                          fontSize: 25 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  }
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25 * SizeConfig.widthMultiplier,
                                  right: 10 * SizeConfig.widthMultiplier,
                                  top: 20 * SizeConfig.heightMultiplier),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height:
                                            60 * SizeConfig.heightMultiplier,
                                        //width: 160 * SizeConfig.widthMultiplier,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'TOTAL PURCHASE',
                                                style: TextStyle(
                                                    fontSize: 15 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    color: Color.fromARGB(
                                                        255, 114, 144, 144)),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 7 *
                                                        SizeConfig
                                                            .heightMultiplier),
                                                child: FutureBuilder(
                                                    future: Future.wait([
                                                      purchaseList,
                                                      sellList,
                                                    ]),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                      if (snapshot.hasData &&
                                                          userModel.tokens >
                                                              0) {
                                                        Map data =
                                                            getPurchaseSellDetails(
                                                                snapshot
                                                                    .data[0],
                                                                snapshot
                                                                    .data[1]);
                                                        double estPurchase =
                                                            data['estPurchase'];
                                                        return Text(
                                                          curf.format(
                                                              (estPurchase
                                                                  .toDouble())),
                                                          style: TextStyle(
                                                              fontSize: 25 *
                                                                  SizeConfig
                                                                      .heightMultiplier),
                                                        );
                                                      } else {
                                                        return Text(
                                                          curf.format(0),
                                                          style: TextStyle(
                                                              fontSize: 25 *
                                                                  SizeConfig
                                                                      .heightMultiplier),
                                                        );
                                                      }
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 140 * SizeConfig.widthMultiplier,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'AVG. RETURN',
                                            style: TextStyle(
                                                fontSize: 15 *
                                                    SizeConfig.heightMultiplier,
                                                color: Color.fromARGB(
                                                    255, 114, 144, 144)),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 7 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            child: FutureBuilder(
                                                future: Future.wait([
                                                  purchaseList,
                                                  sellList,
                                                  tokenList
                                                ]),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData &&
                                                      userModel.tokens > 0) {
                                                    Token token =
                                                        snapshot.data[2][0];
                                                    Map data =
                                                        getPurchaseSellDetails(
                                                            snapshot.data[0],
                                                            snapshot.data[1]);
                                                    double estPurchase =
                                                        data['estPurchase'];
                                                    double estProfit = (token
                                                                .tokenPrice -
                                                            estPurchase /
                                                                userModel
                                                                    .tokens) *
                                                        userModel.tokens;
                                                    double ret =
                                                        (estProfit.abs() / 100);

                                                    return Text(
                                                      ret.toStringAsFixed(2) +
                                                          ' %',
                                                      style: TextStyle(
                                                          fontSize: 25 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  } else {
                                                    return Text(
                                                      curf.format(0),
                                                      style: TextStyle(
                                                          fontSize: 25 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  }
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                      FutureBuilder(
                        future: tokenList,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
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
                                            top: 15 *
                                                SizeConfig.heightMultiplier,
                                            left:
                                                25 * SizeConfig.widthMultiplier,
                                            right:
                                                20 * SizeConfig.widthMultiplier,
                                            bottom: 15 *
                                                SizeConfig.heightMultiplier),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            height: 45 *
                                                SizeConfig.heightMultiplier,
                                            width: 140 *
                                                SizeConfig.widthMultiplier,
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
                                              color: Color.fromARGB(
                                                  255, 66, 71, 112),
                                              child: Text(
                                                'Buy',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                            top: 15 *
                                                SizeConfig.heightMultiplier,
                                            bottom: 15 *
                                                SizeConfig.heightMultiplier),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            height: 45 *
                                                SizeConfig.heightMultiplier,
                                            width: 140 *
                                                SizeConfig.widthMultiplier,
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
                                              color: Color.fromARGB(
                                                  255, 66, 71, 112),
                                              child: Text(
                                                'Sell',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                    ])),
              ],
            ),
            Card(
              child: Container(
                //height: 700 * SizeConfig.heightMultiplier,
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
                  FutureBuilder(
                    future: tokenList,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ChangeNotifierProvider.value(
                            value: userModel,
                            child: Column(
                              children: [TokenTile(data: snapshot.data)],
                            ));
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, double> getPurchaseSellDetails(
      List<Purchase> purchaseList, List<Sell> sellList) {
    //here purchase1 means all purchase Operation before Last Sell operation
    //here purchase2 means all purchase Operation after Last Sell operation
    double totalSell = 0, totalPurchase = 0, purchase1 = 0, purchase2 = 0;
    double sellCount = 0,
        purchaseCount = 0,
        purchaseCount1 = 0,
        purchaseCount2 = 0;
    for (Sell sell in sellList) {
      totalSell += sell.amount;
      sellCount += sell.num_of_tokens;
    }
    for (Purchase purchase in purchaseList) {
      totalPurchase += purchase.amount;
      purchaseCount += purchase.num_of_tokens;
      if (purchase.date.isAfter(sellList.last.date)) {
        purchase2 += purchase.amount;
        purchaseCount2 += purchase.num_of_tokens;
      } else {
        purchase1 += purchase.amount;
        purchaseCount1 += purchase.num_of_tokens;
      }
    }
    // print('${totalSell}');
    // print('${(purchaseCount - estCount)}');
    // print('${(totalPurchase - estPurchase)}');
    // print('${(totalPurchase - estPurchase) / (purchaseCount - estCount)}');
    //print('${sellCount}');
    return {
      'totalSell': totalSell,
      'estPurchase': purchase2 +
          (purchase1 / purchaseCount1) * (purchaseCount1 - sellCount),
      'totalPurchase': totalPurchase,
      'netProfit': totalSell - (purchase1 / purchaseCount1) * sellCount,
    };
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
