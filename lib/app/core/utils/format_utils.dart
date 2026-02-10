/// Shared formatting utilities (numbers, etc.).
abstract final class FormatUtils {
  FormatUtils._();

  /// Formats an integer with thousands separators (e.g. 13112 → "13,112").
  static String formatIntegerWithCommas(int value) {
    return value.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
        );
  }
}
