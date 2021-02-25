class Transaction {
  String type, date;
  double amount, token_price, number_of_tokens;
  Transaction(
      {this.amount,
      this.date,
      this.number_of_tokens,
      this.token_price,
      this.type});
}
