import 'package:ibiz/models/profit.dart';
import 'package:intl/intl.dart';

class ProfitDb {
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
}
