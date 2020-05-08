class RevenueData {
  double revenue;
  String date;
  String currency = "\$";

  RevenueData({this.revenue, this.date});

  String displayRevenue() => "${revenue.toInt()} $currency";

  String displayDate() {
    // display date with new line
    List<String> split = date.split(" ");
    return "${split.first}\n${split.last}";
  }
}