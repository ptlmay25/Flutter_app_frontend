class Token {
  double totalRevenue,
      oparatingExpenses,
      interest,
      netProfit,
      split,
      totalTokens,
      dividendPerToken;
  double tokenPrice;
  bool isExpanded;
  String tokenDate;

  Token(
      {this.dividendPerToken,
      this.split,
      this.tokenPrice,
      this.tokenDate,
      this.interest,
      this.netProfit,
      this.oparatingExpenses,
      this.totalRevenue,
      this.totalTokens,
      this.isExpanded = false});
}
