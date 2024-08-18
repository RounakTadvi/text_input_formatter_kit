part of 'text_input_formatter_kit.dart';

/// [RestrictDigitsAndSpecialCharactersTextInputFormatter]
/// is a custom [TextInputFormatter] that restricts input
/// to exclude digits and special characters.
///
/// This formatter is useful when you need to ensure that the input contains
/// only alphabetic characters and/or specific allowed symbols. For example:
///
/// - Name fields (first name, last name) where digits
///   and special characters are not valid.
/// - Fields that require only letters or specific allowed
///   characters (e.g., usernames without symbols).
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>
///       [RestrictDigitsAndSpecialCharactersTextInputFormatter()],
/// )
/// ```
///
/// In this example, any input containing digits or special characters will be
/// rejected, and only allowed characters will be accepted.
class RestrictDigitsAndSpecialCharactersTextInputFormatter
    extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regular expression to filter out specific characters
    final customRegex =
        RegExp(r'[0-9!@#<>?":_`~;[\]\\|=+)(*&^%$£€•·,./{}|:<>?[\]\\\\]');

    // Check if the new value contains any of the specified characters
    if (customRegex.hasMatch(newValue.text)) {
      // If any specified character is detected, return the old value
      return oldValue;
    }

    // If no specified character is detected, allow the new value
    return newValue;
  }
}
