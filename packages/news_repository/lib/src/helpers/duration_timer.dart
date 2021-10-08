/// Convert given DateTime args [dateISO8601] to specific time
String durationTimer(String? dateISO8601) {
  if (dateISO8601 != null) {
    // ignore: lines_longer_than_80_chars
    final date = DateTime.now().difference(DateTime.parse(dateISO8601));
    if (date.inHours > 0) {
      return '${date.inHours} jam yang lalu';
    } else if (date.inMinutes < 59) {
      return '${date.inMinutes} menit yang lalu';
    } else {
      return '';
    }
  } else {
    return 'Error';
  }
}
