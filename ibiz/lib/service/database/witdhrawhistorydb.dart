import 'dart:convert';

import 'package:ibiz/models/WithdrawHistory.dart';
import 'package:http/http.dart' as http;
import 'package:ibiz/service/database/api.dart';

class WithdrawHistoryDb {
  String url = Api().baseurl + 'app/api/';
  Future<List<WithdrawHistory>> getWithdrawList({id}) async {
    print(id);

    http.Response response = await http
        .get(url + "withdrawRequest/view/user/" + id); //append viewuser/id
    print(url + "withdrawRequest/view/user/" + id);
    List list = json.decode(response.body)['data'];
    print(list.length);

    if (response.statusCode == 200) {
      // print(response.body);
      return List.generate(list.length, (index) {
        // print(index);
        return WithdrawHistory(
            id: list[index]['_id'],
            user_id: list[index]['userId'] ?? '',
            BankAccountNumber: list[index]['BankAccountNumber'].toString(),
            IFSC: list[index]['IFSC'],
            UPI: list[index]['UPI'],
            name: list[index]['name'],
            request_number: list[index]['request_number'],
            total_amount: list[index]['total_amount'],
            status: list[index]['Status'].toString(),
            date: list[index]['createdAt'].toString());
      });
    } else {
      print(response.body);
      return null;
    }
  }
}
