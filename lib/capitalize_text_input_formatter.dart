part of 'text_input_formatter_kit.dart';

/// [CapitalizeTextFormatter] is a custom [TextInputFormatter] that ensures
/// the first letter of each word in the input string is capitalized.
///
/// This formatter is particularly useful for scenarios where the input must
/// start with an uppercase letter, such as:
///
/// - First name and last name fields.
/// - Country or city names.
/// - Any other text field where capitalization is a required validation rule.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[CapitalizeTextFormatter()],
/// )
/// ```
///
/// This formatter will capitalize the first letter of each word as the user
/// types or pastes text into the field.
/// E.g If user enters rounak tadvi, the formatter will convert
/// it into Rounak Tadvi
class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Capitalize the first letter of each word
    return TextEditingValue(
      text: _capitalize(newValue.text),
      selection: newValue.selection,
    );
  }

  String _capitalize(String text) {
    List<String> words = text.split(' ');
    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return word;
      }
    }).toList();
    return words.join(' ');
  }
}
