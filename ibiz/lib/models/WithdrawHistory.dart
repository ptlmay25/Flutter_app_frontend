import 'package:ibiz/view/bottom/AccountTab/withdraw.dart';

class WithdrawHistory {
  String id, user_id, request_number, name, UPI, BankAccountNumber, IFSC;
  String date;
  int total_amount;

  WithdrawHistory(
      {this.IFSC,
      this.UPI,
      this.id,
      this.name,
      this.BankAccountNumber,
      this.request_number,
      this.total_amount,
      this.date,
      this.user_id});
}
