class Purchase {
  String id, date, user_id;
  double amount, token_price, num_of_tokens;
  Purchase(
      {this.amount,
      this.date,
      this.num_of_tokens,
      this.token_price,
      this.id,
      this.user_id});
}
