// Import the necessary packages for testing

import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('NoEmojiTextInputFormatter', () {
    final formatter = NoEmojiTextInputFormatter();

    test('should reject input containing emojis', () {
      // Define a TextEditingValue with emoji input
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello 😊');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter rejects the new value containing the emoji
      expect(result.text, equals(oldValue.text));
    });

    test('should accept input without emojis', () {
      // Define a TextEditingValue with normal text input
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello World');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter accepts the new value without emojis
      expect(result.text, equals(newValue.text));
    });

    test('should reject input with multiple emojis', () {
      // Define a TextEditingValue with multiple emojis
      const oldValue = TextEditingValue(text: 'Welcome');
      const newValue = TextEditingValue(text: 'Welcome 🎉🎂');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter rejects the new value containing multiple emojis
      expect(result.text, equals(oldValue.text));
    });

    test('should accept empty input', () {
      // Define a TextEditingValue with empty input
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue.empty;

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter accepts empty input
      expect(result.text, equals(newValue.text));
    });

    test('should accept input with special characters but no emojis', () {
      // Define a TextEditingValue with special characters
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: r'Hello @#$%&*()');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter accepts the input with special characters
      expect(result.text, equals(newValue.text));
    });

    test('should reject input where emojis are mixed with text', () {
      // Define a TextEditingValue with text and emojis mixed
      const oldValue = TextEditingValue(text: 'Test');
      const newValue = TextEditingValue(text: 'Test 💡Input');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Check if the formatter rejects the new value containing emojis
      expect(result.text, equals(oldValue.text));
    });
  });
}
