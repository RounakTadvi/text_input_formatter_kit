part of 'text_input_formatter_kit.dart';

/// [ReplaceWhiteSpaceTextInputFormatter] is a custom [TextInputFormatter] that
/// replaces all spaces in the input text with a specified character.
///
/// This formatter is useful in scenarios where spaces need to be replaced
/// for consistency or formatting purposes, such as:
///
/// - User input where spaces should be replaced by a specific character
///   (e.g., underscores or hyphens) for usernames, file names, or IDs.
///
/// - Inputs that need to be formatted in a specific way where spaces
/// are not allowed.
///
/// The replacement character can be customized when creating
/// an instance of this formatter.
///
/// Example usage:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[
///     ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_'),
///   ],
/// )
/// ```
///
/// In this example, any spaces entered into the `TextField` will be replaced
/// with underscores. For instance, if a user types "hello world", it will
/// be displayed as "hello_world".
///
/// To replace spaces with a hyphen, you would use:
/// ```dart
/// TextField(
///   inputFormatters: <TextInputFormatter>[
///     ReplaceWhiteSpaceTextInputFormatter(replacementChar: '-'),
///   ],
/// )
/// ```
///
/// In this case, "hello world" will be displayed as "hello-world".
class ReplaceWhiteSpaceTextInputFormatter extends TextInputFormatter {
  /// Creates an instance of [ReplaceWhiteSpaceTextInputFormatter]
  /// with a specified
  /// replacement character.
  ///
  ///
  /// Throws an [ArgumentError] if [replacementChar]
  /// is empty or more than one character.
  ReplaceWhiteSpaceTextInputFormatter({required this.replacementChar}) {
    if (replacementChar.isEmpty || replacementChar.length > 1) {
      throw ArgumentError('replacementChar must be a single character');
    }
  }

  /// The [replacementChar] parameter specifies the character that will replace
  /// all spaces in the input text. It should be a single character.
  final String replacementChar;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Replace all spaces with the specified replacement character
    final String formattedText = newValue.text.replaceAll(' ', replacementChar);

    // Return the new TextEditingValue with the formatted text
    return TextEditingValue(
      text: formattedText,
      selection: newValue.selection,
    );
  }
}
