part of 'text_input_formatter_kit.dart';

/// [NoEmojiTextInputFormatter] is a custom [TextInputFormatter]
/// that prevents users from entering emojis
/// into a [TextField].
///
/// This formatter is useful for scenarios where
/// emojis are not allowed in the input, such as:
///
/// - Fields where only text is expected
///   (e.g., first or last name of user, email, phone number, etc.).
/// - Input areas where emojis might not be suitable or
///   allowed by the application.
///
/// The formatter uses a regular expression to detect
/// and filter out emojis based on Unicode ranges commonly
/// used for emoji characters.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[NoEmojiTextInputFormatter()],
/// )
/// ```
///
/// In this example, any input containing emojis will be rejected, and only text
/// without emojis will be accepted.
class NoEmojiTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regular expression to filter out emojis
    final noEmojiRegex = RegExp(
      '''(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])''',
    );

    // Check if the new value contains emojis
    if (noEmojiRegex.hasMatch(newValue.text)) {
      // If emoji is detected, return the old value
      return oldValue;
    }

    // If no emoji is detected, allow the new value
    return newValue;
  }
}
