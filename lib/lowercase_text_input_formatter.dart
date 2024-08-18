part of 'text_input_formatter_kit.dart';

/// [LowerCaseTextFormatter] is a custom [TextInputFormatter] that converts
/// all input text to lowercase.
///
/// This formatter is useful when you want to ensure that all text input
/// is automatically converted to lowercase. This can be particularly helpful
/// in scenarios where case-insensitivity is desired, such as:
///
/// - Usernames or email fields where case does not matter.
/// - Fields that should always display text in a consistent lowercase format.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[LowerCaseTextFormatter()],
/// )
/// ```
///
/// In this example, any text entered into the `TextField` will be automatically
/// converted to lowercase. For instance, if a user types "Hello WORLD",
/// the `TextField` will display "hello world".
///
/// E.g If user enters TEST@GMAIL.COM, the formatter will convert
/// it into test@gmail.com
class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Convert the new input text to lowercase
    final String lowerCaseText = newValue.text.toLowerCase();

    // Create a new TextEditingValue with the lowercase text
    return TextEditingValue(
      text: lowerCaseText,
      selection: newValue.selection,
    );
  }
}
