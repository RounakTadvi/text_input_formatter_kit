part of 'text_input_formatter_kit.dart';

/// [SpacerInputFormatter] is a custom [TextInputFormatter] that adds a space
/// after every specified number of characters in the input text.
///
/// This formatter is useful for formatting input where grouping of characters
/// is needed, such as:
///
/// - Credit card numbers, where grouping digits into sets of four is common.
/// - Phone numbers or identification numbers that require formatting for better
///   readability.
/// - Aadhaar card number
/// - PAN card number
/// - Social security number
///
/// The number of characters before inserting a space
/// can be specified dynamically.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>
///      [SpacerInputFormatter(spaceEvery: 4)],
/// )
/// ```
///
/// In this example, a space will be
/// automatically added after every 4 characters.
/// If a user types "12345678", the `TextField` will display "1234 5678".
///
/// You can customize the spacing by providing a
/// different value for `spaceEvery`.
class SpacerInputFormatter extends TextInputFormatter {
  /// Creates an instance of [SpacerInputFormatter]
  /// with a specified number of characters
  /// after which a space will be inserted.
  /// For example, if [spaceEvery] is set to 4, a space will be inserted
  /// after every 4 characters.
  /// Throws an [ArgumentError] if [spaceEvery] is less than 1.
  SpacerInputFormatter({required this.spaceEvery}) {
    if (spaceEvery < 1) {
      throw ArgumentError('spaceEvery must be greater than or equal to 1');
    }
  }

  /// The [spaceEvery] parameter specifies the number of characters
  /// before a space is added.
  final int spaceEvery;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Return the new value if the cursor is at the start
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Use a StringBuffer to build the formatted text
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;

      // Insert a space after every `spaceEvery` characters, except at the end
      if (nonZeroIndex % spaceEvery == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
