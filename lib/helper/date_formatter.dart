import 'package:intl/intl.dart';

class DateFormatter {
  /// Formats a DateTime to 'dd-MM-yyyy' string (used for UI display)
  static String toDisplayDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  /// Formats a DateTime to 'yyyy-MM-dd' string (used for API bodies)
  static String toApiDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Converts a display date string ('dd-MM-yyyy') to api date string ('yyyy-MM-dd')
  static String convertDisplayToApi(String displayDate) {
    if (displayDate.trim().isEmpty) return '';
    try {
      final parsed = DateFormat('dd-MM-yyyy').parse(displayDate.trim());
      return toApiDate(parsed);
    } catch (_) {
      return displayDate;
    }
  }
}
