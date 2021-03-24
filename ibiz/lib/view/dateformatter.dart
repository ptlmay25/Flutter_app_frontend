class DateFormatter {
  String format(DateTime date) {
    return getMonth(date.day) +
        '/' +
        getMonth(date.month) +
        '/' +
        date.year.toString();
  }

  String getMonth(int m) {
    return m >= 10 ? m.toString() : '0' + m.toString();
  }

  String timeFormatter(DateTime date) {
    String unit = (date.hour > 12) ? 'PM' : 'AM';
    String h = '12';
    if (date.hour > 12) {
      h = (date.hour.toInt() - 12).toString();
    } else if (date.hour == 0) {
      unit = 'AM';
    } else {
      unit = 'AM';
      h = date.hour.toString();
    }
    return h + ':' + date.minute.toString() + ' ' + unit;
  }
}
