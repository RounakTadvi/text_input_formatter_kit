// Import the necessary packages for testing
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('ReplaceWhiteSpaceTextInputFormatter', () {
    test('should replace spaces with the specified character', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_');
      const oldValue = TextEditingValue(text: 'Hello World');
      const newValue = TextEditingValue(text: 'Hello World');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello_World');
    });

    test('should replace spaces with a hyphen', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '-');
      const oldValue = TextEditingValue(text: 'Test Input');
      const newValue = TextEditingValue(text: 'Test Input');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Test-Input');
    });

    test('should not change text without spaces', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_');
      const oldValue = TextEditingValue(text: 'NoSpacesHere');
      const newValue = TextEditingValue(text: 'NoSpacesHere');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'NoSpacesHere');
    });

    test('should handle multiple spaces correctly', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_');
      const oldValue = TextEditingValue(text: 'Multiple   Spaces');
      const newValue = TextEditingValue(text: 'Multiple   Spaces');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Multiple___Spaces');
    });

    test('should handle empty input', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_');
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue.empty;

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });

    test('should throw ArgumentError for empty replacementChar', () {
      expect(
        () => ReplaceWhiteSpaceTextInputFormatter(replacementChar: ''),
        throwsArgumentError,
      );
    });

    test(
        '''should throw ArgumentError for replacementChar with more than one character''',
        () {
      expect(
        () => ReplaceWhiteSpaceTextInputFormatter(replacementChar: '--'),
        throwsArgumentError,
      );
    });

    test('should maintain the cursor position after replacement', () {
      final formatter =
          ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_');
      const oldValue = TextEditingValue(
        text: 'Hello World',
        selection: TextSelection.collapsed(offset: 5),
      );
      const newValue = TextEditingValue(
        text: 'Hello World',
        selection: TextSelection.collapsed(offset: 5),
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello_World');
      expect(result.selection, newValue.selection);
    });
  });
}
