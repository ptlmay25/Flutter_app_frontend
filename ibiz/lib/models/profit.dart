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
