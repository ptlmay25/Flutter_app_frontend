import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';
import 'package:intl/intl.dart';

class ProfitList extends StatefulWidget {
  @override
  _ProfitListState createState() => _ProfitListState();
}

class _ProfitListState extends State<ProfitList> {
  List<Profit> _data = getProfit();
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
                        Text('₹ ' + profit.headerProfit.toString() + ' INR',
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
                  right: 65 * SizeConfig.widthMultiplier),
              child: Container(
                child: Column(children: <Widget>[
                  Row(children: [
                    Expanded(child: Text('Total Revenue:')),
                    Text('₹ ' + profit.totalRevenue.toString(),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Operating Expenes:')),
                    Text('- ₹ ' + profit.oparatingExpenses.toString(),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('interest + tax:')),
                    Text('- ₹ ' + profit.interest.toString(),
                        style: TextStyle(color: Colors.red))
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Service fee')),
                    Text('- ₹ ' + profit.serviceFee.toString())
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Net profit')),
                    Text('₹ ' + profit.netProfit.toString())
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Total outstanding  tokens :')),
                    Text('÷ ' + profit.totalTokens.toString())
                  ]),
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Row(children: [
                    Expanded(child: Text('Dividend per token :')),
                    Text('₹ ' + profit.dividendPerToken.toString())
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
      child: Container(child: _buildProfitList()),
    );
  }
}

class Profit {
  int headerProfit,
      totalRevenue,
      oparatingExpenses,
      interest,
      serviceFee,
      netProfit,
      totalTokens,
      dividendPerToken;
  bool isExpanded;
  String headerDate;
  String headerMonth, headerYear;
  Profit(
      {this.dividendPerToken,
      this.headerDate,
      this.headerMonth,
      this.headerProfit,
      this.headerYear,
      this.interest,
      this.netProfit,
      this.oparatingExpenses,
      this.serviceFee,
      this.totalRevenue,
      this.totalTokens,
      this.isExpanded = false});
}

List<Profit> getProfit() {
  return List.generate(1, (index) {
    return Profit(
        headerMonth: 'January',
        headerYear: '2021',
        headerDate: DateFormat('2021-05-03').format(null),
        headerProfit: 5000,
        totalRevenue: 210000,
        oparatingExpenses: 2000000,
        interest: 5000,
        serviceFee: 5000,
        netProfit: 5000,
        totalTokens: 500,
        dividendPerToken: 10);
  });
}
