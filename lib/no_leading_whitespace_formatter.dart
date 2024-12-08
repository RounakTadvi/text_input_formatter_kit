part of 'text_input_formatter_kit.dart';

/// [NoLeadingWhitespaceFormatter] is a custom [TextInputFormatter]
/// that removes leading whitespace from user input in a
/// TextField.
///
/// This formatter is useful for scenarios where leading whitespace
/// is not allowed or desired, such as:
///
/// - Username or email fields where leading spaces could cause
/// validation issues.
/// - Form fields where clean input is required.
///
/// The formatter automatically trims any leading whitespace
/// when the user types in the field.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[NoLeadingWhitespaceFormatter()],
/// )
/// ```
///
/// In this example, any leading whitespace entered by the user
/// will be removed automatically.
class NoLeadingWhitespaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove leading whitespaces
    final String newText = newValue.text.replaceFirst(RegExp(r'^\s+'), '');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
