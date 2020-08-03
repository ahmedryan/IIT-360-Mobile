class ReadableDate {
  DateTime date;

  ReadableDate(this.date);

  static String convertDate(date) {
    String sDate;
    sDate = date.toString();

    sDate = sDate.substring(0, 10);

    return sDate;
  }
}
