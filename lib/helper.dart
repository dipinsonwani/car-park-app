extension DateTimeFormatting on DateTime {
  String toCustomFormat() {
    final hour =
        this.hour > 12 ? this.hour - 12 : (this.hour == 0 ? 12 : this.hour);
    final minute = this.minute.toString().padLeft(2, '0');
    final period = this.hour >= 12 ? 'pm' : 'am';
    final day = this.day;
    final month = _monthNames[this.month - 1];
    return '$hour:$minute$period $day $month';
  }

  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}
