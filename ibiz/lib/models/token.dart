class Token {
  int headerProfit,
      totalRevenue,
      oparatingExpenses,
      interest,
      serviceFee,
      netProfit,
      totalTokens,
      dividendPerToken;
    double tokenPrice;
  bool isExpanded;
  String headerDate;
  String headerMonthYear;
  Token(
      {this.tokenPrice,
      this.headerDate,
      this.headerMonthYear,
      this.headerProfit,
      this.interest,
      this.netProfit,
      this.oparatingExpenses,
      this.serviceFee,
      this.totalRevenue,
      this.totalTokens,
      this.isExpanded = false});
}
