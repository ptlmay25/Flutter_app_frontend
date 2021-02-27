import 'package:flutter/material.dart';
import 'package:ibiz/models/transaction.dart';
import 'package:ibiz/models/usermodel.dart';
import 'package:ibiz/service/database/transactiondb.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/AccountTab/withdraw.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ibiz/models/purchase.dart';
import 'package:ibiz/models/sell.dart';
import 'package:ibiz/service/database/purchasedb.dart';
import 'package:ibiz/service/database/selldb.dart';

class Accounttab extends StatefulWidget {
  @override
  _AccounttabState createState() => _AccounttabState();
}

class _AccounttabState extends State<Accounttab> {
  String _selectedData;
  List<String> _Data = [
    "Last 7 days",
    "Last 30 days",
    "Last 6 month",
    "Last year",
    "All",
  ];

  @override
  Widget build(BuildContext context) {
    var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
    UserModel userModel = Provider.of<UserModel>(context);
    Future<double> estPurchaseAns = estPurchaseAvg(userModel);
    Future<List<Sell>> sellList = SellDb().getSell(id: userModel.id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // Container(
          //     color: Color.fromARGB(255, 66, 71, 112),
          //     child: Column(children: <Widget>[
          //       Padding(
          //         padding:
          //             EdgeInsets.only(top: 0 * SizeConfig.heightMultiplier),
          //         child: Column(
          //           children: <Widget>[
          //             Padding(
          //               padding: EdgeInsets.only(),
          //               child: Text(
          //                 curf.format(userModel.acc_bal),
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 28,
          //                   fontFamily: "Roboto",
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   top: 20 * SizeConfig.heightMultiplier),
          //               child: Text(
          //                 "Your Balance",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 13,
          //                   fontFamily: "Roboto",
          //                   fontWeight: FontWeight.w300,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   top: 5 * SizeConfig.heightMultiplier),
          //               child: Text(
          //                 DateTime.now().toString().substring(0,16),
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 13,
          //                   fontFamily: "Roboto",
          //                   fontWeight: FontWeight.w300,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
          //                   left: 58 * SizeConfig.widthMultiplier,
          //                   top: 26 * SizeConfig.heightMultiplier,
          //                   bottom: 38 * SizeConfig.heightMultiplier),
          //               child: Row(
          //                 children: [
          //                   ClipRRect(
          //                     borderRadius: BorderRadius.circular(5),
          //                     child: Container(
          //                       height: 40 * SizeConfig.heightMultiplier,
          //                       width: 120 * SizeConfig.widthMultiplier,
          //                       child: RaisedButton(
          //                         onPressed: () {
          //                           Navigator.of(context).push(
          //                               MaterialPageRoute(
          //                                   builder: (context) =>
          //                                       ChangeNotifierProvider.value(
          //                                           value: userModel,
          //                                           child: AddFund(
          //                                             userModel: userModel,
          //                                           ))));
          //                         },
          //                         color: Color.fromARGB(255, 108, 113, 156),
          //                         child: Text(
          //                           'Add Funds',
          //                           style: TextStyle(
          //                               color: Colors.white,
          //                               fontWeight: FontWeight.normal,
          //                               fontSize:
          //                                   16 * SizeConfig.heightMultiplier),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(width: 20 * SizeConfig.widthMultiplier),
          //                   ClipRRect(
          //                     borderRadius: BorderRadius.circular(5),
          //                     child: Container(
          //                       height: 40 * SizeConfig.heightMultiplier,
          //                       width: 120 * SizeConfig.widthMultiplier,
          //                       child: RaisedButton(
          //                         onPressed: () {
          //                           Navigator.of(context).push(MaterialPageRoute(
          //                               builder: (context) =>
          //                                   ChangeNotifierProvider.value(
          //                                       value: userModel,
          //                                       child: ChangeNotifierProvider
          //                                           .value(
          //                                               value: userModel,
          //                                               child: Withdraw()))));
          //                         },
          //                         color: Color.fromARGB(255, 108, 113, 156),
          //                         child: Text(
          //                           'Withdraw',
          //                           style: TextStyle(
          //                               color: Colors.white,
          //                               fontWeight: FontWeight.normal,
          //                               fontSize:
          //                                   16 * SizeConfig.heightMultiplier),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ])),
          Container(
              color: Color.fromARGB(255, 66, 71, 112),
              child: Column(children: <Widget>[
                SizedBox(height: 15 * SizeConfig.heightMultiplier),
                Row(
                  children: [
                    SizedBox(width: 20 * SizeConfig.widthMultiplier),
                    SizedBox(
                      height: 60 * SizeConfig.heightMultiplier,
                      width: 60 * SizeConfig.widthMultiplier,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/icons/user_icon.png"),
                      ),
                    ),
                    SizedBox(width: 15 * SizeConfig.widthMultiplier),
                    Text(
                      userModel.username,
                      style: TextStyle(
                          fontSize: 15 * SizeConfig.heightMultiplier,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 30 * SizeConfig.heightMultiplier),
                Padding(
                  padding:
                      EdgeInsets.only(left: 25 * SizeConfig.widthMultiplier),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          curf.format(userModel.acc_bal),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10 * SizeConfig.heightMultiplier),
                Padding(
                  padding: EdgeInsets.only(
                      left: 25 * SizeConfig.widthMultiplier,
                      right: 25 * SizeConfig.widthMultiplier),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Your Balance        ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(height: 3 * SizeConfig.heightMultiplier),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              DateTime.now().toString().substring(0, 16),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      FlatButton(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25 * SizeConfig.heightMultiplier,
                                width: 40 * SizeConfig.widthMultiplier,
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 3 * SizeConfig.heightMultiplier),
                              Text(
                                'withdraw',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12 * SizeConfig.heightMultiplier,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider.value(
                                        value: userModel,
                                        child: ChangeNotifierProvider.value(
                                            value: userModel,
                                            child: Withdraw()))));
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 35 * SizeConfig.heightMultiplier),
              ])),
          SizedBox(height: 20 * SizeConfig.heightMultiplier),
          Padding(
            padding: EdgeInsets.only(
                left: 22 * SizeConfig.widthMultiplier,
                right: 22 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 70 * SizeConfig.heightMultiplier,
                      width: 160 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: Column(children: [
                        SizedBox(height: 15 * SizeConfig.heightMultiplier),
                        Text("Total Purchase"),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        Text(curf.format(userModel.total_purchase)),
                      ]),
                    ),
                    SizedBox(width: 15 * SizeConfig.heightMultiplier),
                    Container(
                      height: 70 * SizeConfig.heightMultiplier,
                      width: 160 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: Column(children: [
                        SizedBox(height: 15 * SizeConfig.heightMultiplier),
                        Text("Total Sales"),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        Text(curf.format(userModel.total_sell)),
                      ]),
                    ),
                  ],
                ),
                SizedBox(height: 20 * SizeConfig.heightMultiplier),
                Row(
                  children: [
                    Container(
                      height: 70 * SizeConfig.heightMultiplier,
                      width: 160 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 212, 31),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        SizedBox(height: 15 * SizeConfig.heightMultiplier),
                        Text("Total Profit"),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        FutureBuilder(
                            future: Future.wait([estPurchaseAns, sellList]),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                double avgPurchasePrice = snapshot.data[0];
                                //print(snapshot.data[1]);
                                double avgSellPrice = getAvgSellPrice(
                                    snapshot.data[1], userModel);
                                print('$avgSellPrice $avgPurchasePrice');
                                double noOfTokenSold =
                                    tokenSold(snapshot.data[1], userModel);
                                //print(noOfTokenSold);
                                double avgProfit =
                                    avgSellPrice - avgPurchasePrice;
                                //print(avgProfit);
                                double netProfit = avgProfit * noOfTokenSold;
                                return Text(
                                    curf.format(netProfit.abs().toDouble()));
                              } else {
                                return Text(curf.format(0));
                              }
                            }),
                      ]),
                    ),
                    Container(
                      height: 70 * SizeConfig.heightMultiplier,
                      width: 160 * SizeConfig.widthMultiplier,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 30 * SizeConfig.heightMultiplier,
                left: 22 * SizeConfig.widthMultiplier),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Transaction",
                    style: TextStyle(
                      color: Color(0xff151515),
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 21 * SizeConfig.widthMultiplier),
                  child: Container(
                    height: 30 * SizeConfig.heightMultiplier,
                    width: 107 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xff151515),
                        width: 0.50,
                      ),
                      color: Colors.white,
                    ),
                    child: DropdownButton(
                      underline: Container(color: Colors.transparent),
                      hint: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "   Last 7 days",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff151515),
                            fontSize: 12,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      value: _selectedData,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedData = newValue;
                        });
                      },
                      items: _Data.map((data) {
                        return DropdownMenuItem(
                          child: new Text(
                            data,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          value: data,
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 650 * SizeConfig.heightMultiplier,
            child: FutureBuilder(
              future: TransactionDb().getTransactions(id: userModel.id),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Transaction> transactionList = snapshot.data;
                  return Container(
                    height: 400 * SizeConfig.heightMultiplier,
                    child: ListView.builder(
                        itemCount: transactionList.length,
                        itemBuilder: (context, index) {
                          return getList(transactionList[index]);
                        }),
                  );
                } else {
                  return Text("");
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getList(Transaction transaction) {
    var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
    return Padding(
      padding: EdgeInsets.only(
          top: 32 * SizeConfig.heightMultiplier,
          right: 21 * SizeConfig.widthMultiplier),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    width: 210,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 23 * SizeConfig.widthMultiplier),
                          child: Text(
                            transaction.type,
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 23 * SizeConfig.widthMultiplier),
                          child: Text(
                            "Date: " +
                                transaction.date.toString().substring(0, 10),
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 14,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
              getSign(transaction.type) +
                  curf.format(transaction.amount) +
                  " INR",
              textAlign: TextAlign.right,
              style: getStyle(transaction.type)),
        ],
      ),
    );
  }

  String getSign(type) {
    if (type == 'Deposit' || type == 'Token Sell') {
      return '+ ';
    } else if (type == 'Token Buy' || type == 'Withdraw') {
      return '- ';
    } else {
      return '';
    }
  }

  TextStyle getStyle(type) {
    if (type == 'Deposit' || type == 'Token Sell') {
      return TextStyle(
        color: Color(0xff3c8f7c),
        fontSize: 15,
      );
    } else if (type == 'Token Buy' || type == 'Withdraw') {
      return TextStyle(
        color: Colors.red,
        fontSize: 15,
      );
    } else {
      return TextStyle(
        color: Color(0xff3c8f7c),
        fontSize: 15,
      );
    }
  }

  Future<double> estPurchaseAvg(UserModel userModel) async {
    double est = 0;
    double n = 0;
    List<Purchase> purchaseList =
        await PurchaseDb().getPurchase(id: userModel.id);
    //print("list" + purchaseList.length.toString());
    if (purchaseList.length > 0) {
      for (var i = 0; i < purchaseList.length; i++) {
        if (purchaseList[i].user_id == userModel.id) {
          Purchase purchase = purchaseList[i];
          //print(purchase.amount);
          est += purchase.amount;
          n += purchase.num_of_tokens;
        }
      }
    }
    //print(n);
    if (n > 0) {
      //print(est);
      return (est / n).toDouble();
    } else {
      return 0;
    }
  }

  double getAvgSellPrice(List<Sell> sellList, UserModel userModel) {
    double est = 0;
    double n = 0;

    //print("list" + sellList.length.toString());
    if (sellList.length > 0) {
      for (var i = 0; i < sellList.length; i++) {
        if (sellList[i].user_id == userModel.id) {
          Sell sell = sellList[i];
          //print(purchase.amount);
          est += sell.amount;
          n += sell.num_of_tokens;
        }
      }
    }
    //print(n);
    if (n > 0) {
      //print(est);
      return (est / n).toDouble();
    } else {
      return 0;
    }
  }

  double tokenSold(List<Sell> sellList, UserModel userModel) {
    double n = 0;
    for (Sell sell in sellList) {
      if (sell.user_id == userModel.id) {
        n += sell.num_of_tokens;
      }
    }
    return n;
  }
}
