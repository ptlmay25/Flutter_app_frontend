import 'package:flutter/material.dart';
import 'package:ibiz/models/purchase.dart';
import 'package:ibiz/models/sell.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/purchasedb.dart';
import 'package:ibiz/service/database/selldb.dart';
import 'package:ibiz/service/database/tokendb.dart';
import 'package:ibiz/service/database/userdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/buysheet.dart';
import 'package:ibiz/view/bottom/HomeTab/chart.dart';
import 'package:ibiz/view/bottom/HomeTab/sellsheet.dart';
import 'package:ibiz/view/bottom/HomeTab/tokentile.dart';
import 'package:ibiz/view/dateformatter.dart';
import 'package:ibiz/view/formatter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Hometab extends StatefulWidget {
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    setState(() {});
    _refreshController.loadComplete();
  }

  var curf = new NumberFormat.currency(locale: "en_IN", symbol: "₹ ");
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    Future<dynamic> dynamicUserModel =
        Userdb().getUserByMobileNo(userModel.mobileNo);
    Future<List<Token>> tokenList = TokenDb().getToken();
    Future<List<Purchase>> purchaseList =
        PurchaseDb().getPurchase(id: userModel.id);
    Future<List<Sell>> sellList = SellDb().getSell(id: userModel.id);

    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
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
                                      double estProfit = (latestToken
                                                  .tokenPrice -
                                              estPurchase / userModel.tokens) *
                                          userModel.tokens;
                                      double n = 0;
                                      double inc = userModel.tokens *
                                          latestToken.dividendPerToken;
                                      if (!(estProfit + estPurchase).isNaN) {
                                        n = estProfit + estPurchase;
                                      }
                                      return Column(
                                        children: [
                                          Text(curf.format(((n).toDouble())),
                                              style: TextStyle(
                                                  fontSize: 30 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  fontFamily: "Roboto",
                                                  color: Colors.white)),
                                          SizedBox(
                                              height: 4 *
                                                  SizeConfig.heightMultiplier),
                                          Text(
                                              '+ ' +
                                                  Formatter()
                                                      .numberFormat(inc) +
                                                  '   Last month dividend',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 212, 31),
                                                  fontSize: 16 *
                                                      SizeConfig
                                                          .heightMultiplier))
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: [
                                          Text(curf.format(0),
                                              style: TextStyle(
                                                  fontSize: 30 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  fontFamily: "Roboto",
                                                  color: Colors.white)),
                                          SizedBox(
                                              height: 4 *
                                                  SizeConfig.heightMultiplier),
                                          Text('+0.00   Last month dividend',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 212, 31),
                                                  fontSize: 16 *
                                                      SizeConfig
                                                          .heightMultiplier))
                                        ],
                                      );
                                    }
                                  }),
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
                                            Token latestToken =
                                                snapshot.data[0];
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
                                    trailing: Text(
                                        DateFormatter().format(DateTime.now())),
                                  )),
                              SizedBox(
                                  height: 35 * SizeConfig.heightMultiplier),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    SizeConfig
                                                        .heightMultiplier),
                                            child: FutureBuilder(
                                              future: dynamicUserModel,
                                              builder: (context, snapShot) {
                                                int tokens = 0;
                                                if (snapShot.hasData) {
                                                  UserModel snapUserModel =
                                                      snapShot.data;
                                                  tokens = snapUserModel.tokens;
                                                }
                                                return Text(
                                                  tokens.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18 *
                                                          SizeConfig
                                                              .heightMultiplier),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              25 * SizeConfig.widthMultiplier),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'EST. PROFIT',
                                            style: TextStyle(
                                                fontSize: 15 *
                                                    SizeConfig.heightMultiplier,
                                                color: Color.fromARGB(
                                                    255, 114, 144, 144)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 7 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            child: FutureBuilder(
                                                future: Future.wait([
                                                  purchaseList,
                                                  sellList,
                                                  tokenList,
                                                  dynamicUserModel
                                                ]),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    UserModel userModel =
                                                        snapshot.data[3];
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
                                                    double val =
                                                        (estProfit.isNaN)
                                                            ? 0
                                                            : estProfit;
                                                    return Text(
                                                      curf.format(val.abs()),
                                                      style: TextStyle(
                                                          fontSize: 18 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  } else {
                                                    return Text(
                                                      curf.format(0),
                                                      style: TextStyle(
                                                          fontSize: 18 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  }
                                                }),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'TOTAL PURCHASE',
                                            style: TextStyle(
                                                fontSize: 15 *
                                                    SizeConfig.heightMultiplier,
                                                color: Color.fromARGB(
                                                    255, 114, 144, 144)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 7 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            child: FutureBuilder(
                                                future: Future.wait([
                                                  purchaseList,
                                                  sellList,
                                                ]),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData &&
                                                      userModel.tokens > 0) {
                                                    Map data =
                                                        getPurchaseSellDetails(
                                                            snapshot.data[0],
                                                            snapshot.data[1]);
                                                    double estPurchase =
                                                        data['estPurchase'];
                                                    return Text(
                                                      curf.format((estPurchase
                                                          .toDouble())),
                                                      style: TextStyle(
                                                          fontSize: 18 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  } else {
                                                    return Text(
                                                      curf.format(0),
                                                      style: TextStyle(
                                                          fontSize: 18 *
                                                              SizeConfig
                                                                  .heightMultiplier),
                                                    );
                                                  }
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              25 * SizeConfig.widthMultiplier),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'AVG. RETURN',
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
                                                    tokenList,
                                                    dynamicUserModel
                                                  ]),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData &&
                                                        userModel.tokens > 0) {
                                                      UserModel userModel =
                                                          snapshot.data[3];
                                                      Token token =
                                                          snapshot.data[2][0];
                                                      Map data =
                                                          getPurchaseSellDetails(
                                                              snapshot.data[0],
                                                              snapshot.data[1]);
                                                      double totalPurchase =
                                                          data['totalPurchase'];
                                                      double estProfit = (token
                                                                  .tokenPrice -
                                                              totalPurchase /
                                                                  userModel
                                                                      .tokens) *
                                                          userModel.tokens;

                                                      double ret = (estProfit
                                                              .isNaN)
                                                          ? 0
                                                          : (estProfit.abs() /
                                                                  totalPurchase) *
                                                              100;
                                                      // print("ret:" +
                                                      //     ret.toString());

                                                      return Text(
                                                        ret.toStringAsFixed(2) +
                                                            ' %',
                                                        style: TextStyle(
                                                            fontSize: 18 *
                                                                SizeConfig
                                                                    .heightMultiplier),
                                                      );
                                                    } else {
                                                      return Text(
                                                        '0.00 %',
                                                        style: TextStyle(
                                                            fontSize: 18 *
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
                          future: Future.wait([tokenList, dynamicUserModel]),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              UserModel snapUserModel = snapshot.data[1];
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
                                              left: 25 *
                                                  SizeConfig.widthMultiplier,
                                              right: 20 *
                                                  SizeConfig.widthMultiplier,
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
                                                  Token token =
                                                      snapshot.data[0][0];
                                                  double price =
                                                      token.tokenPrice;

                                                  showBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return BuySheet(
                                                            tokenPrice: price,
                                                            userModel:
                                                                snapUserModel);
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
                                                  Token token =
                                                      snapshot.data[0][0];

                                                  double price =
                                                      token.tokenPrice;
                                                  showBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return SellSheet(
                                                          tokenPrice: price,
                                                          userModel:
                                                              snapUserModel,
                                                        );
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
      'estPurchase': (purchaseCount1 == 0)
          ? 0
          : purchase2 +
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
