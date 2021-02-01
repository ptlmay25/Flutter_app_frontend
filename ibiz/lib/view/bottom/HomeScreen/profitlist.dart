import 'package:flutter/material.dart';
import 'package:ibiz/models/profit.dart';
import 'package:ibiz/service/database/profitdb.dart';
import 'package:ibiz/size_config.dart';
import 'package:intl/intl.dart';

class ProfitList extends StatefulWidget {
  @override
  _ProfitListState createState() => _ProfitListState();
}

class _ProfitListState extends State<ProfitList> {
  var curf = new NumberFormat.currency(locale: "en_us", symbol: "₹ ");
  List<Profit> _data = ProfitDb().getProfit();
  Widget _buildProfitList() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Profit profit) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: EdgeInsets.only(left: 10 * SizeConfig.widthMultiplier),
                child: Container(
                  height: 60 * SizeConfig.heightMultiplier,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10 * SizeConfig.heightMultiplier,
                        left: 10 * SizeConfig.widthMultiplier),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                    profit.headerMonth +
                                        ' ' +
                                        profit.headerYear,
                                    style: TextStyle(
                                        fontSize:
                                            14 * SizeConfig.heightMultiplier)),
                                Text('Date: ' + profit.headerDate.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            11 * SizeConfig.heightMultiplier))
                              ],
                            ),
                          ),
                        ),
                        Text(curf.format(profit.headerProfit) + ' INR',
                            style: TextStyle(
                                fontSize: 14 * SizeConfig.heightMultiplier,
                                color: Colors.green))
                      ],
                    ),
                  ),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.only(
                  left: 20 * SizeConfig.widthMultiplier,
                  right: 65 * SizeConfig.widthMultiplier,
                  bottom: 10*SizeConfig.heightMultiplier),
              child: Container(
                child: Column(children: <Widget>[
                  Row(children: [
                    Expanded(child: Text('Total Revenue:')),
                    Text('- ' + curf.format(profit.totalRevenue),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Operating Expenes:')),
                    Text('- ' + curf.format(profit.oparatingExpenses),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('interest + tax:')),
                    Text('- ' + curf.format(profit.interest),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Service fee')),
                    Text('- ' + curf.format(profit.serviceFee))
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Net profit')),
                    Text(curf.format(profit.netProfit))
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Total outstanding  tokens :')),
                    Text('÷ ' + profit.totalTokens.toString())
                  ]),
                  const Divider(color: Colors.grey, height: 2, thickness: 2),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Dividend per token :')),
                    Text(curf.format(profit.dividendPerToken))
                  ]),
                ]),
              ),
            ),
            isExpanded: profit.isExpanded);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 5 * SizeConfig.heightMultiplier),
        child: _buildProfitList(),
      )),
    );
  }
}
