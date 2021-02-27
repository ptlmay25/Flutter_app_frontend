class Purchase {
  String id,  user_id;
  DateTime date;
  double amount, token_price, num_of_tokens;
  Purchase(
      {this.amount,
      this.date,
      this.num_of_tokens,
      this.token_price,
      this.id,
      this.user_id});
}
