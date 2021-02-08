class Token {
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
  String headerMonthYear;
  Token(
      {this.dividendPerToken,
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
