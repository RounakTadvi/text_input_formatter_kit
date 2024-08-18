// Import the Flutter test package and the LowerCaseTextFormatter

import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('LowerCaseTextFormatter', () {
    final formatter = LowerCaseTextFormatter();

    test('should convert all letters to lowercase', () {
      // Define a TextEditingValue with some input text
      const oldValue = TextEditingValue(text: 'HELLO WORLD');
      const newValue = TextEditingValue(text: 'HELLO WORLD');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue =
          TextEditingValue(text: 'hello world', selection: newValue.selection);

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle mixed case input correctly', () {
      // Define a TextEditingValue with mixed case input text
      const oldValue = TextEditingValue(text: 'HeLLo WoRLd');
      const newValue = TextEditingValue(text: 'HeLLo WoRLd');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue =
          TextEditingValue(text: 'hello world', selection: newValue.selection);

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle lowercase input', () {
      // Define a TextEditingValue with already lowercase input text
      const oldValue = TextEditingValue(text: 'hello world');
      const newValue = TextEditingValue(text: 'hello world');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue =
          TextEditingValue(text: 'hello world', selection: newValue.selection);

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle empty input', () {
      // Define a TextEditingValue with empty input text
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue.empty;

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue = TextEditingValue(
        // ignore: avoid_redundant_argument_values
        text: '',
        selection: newValue.selection,
      );

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle input with special characters', () {
      // Define a TextEditingValue with input text including special characters
      const oldValue = TextEditingValue(text: 'TEST@GMAIL.COM');
      const newValue = TextEditingValue(text: 'TEST@GMAIL.COM');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue = TextEditingValue(
        text: 'test@gmail.com',
        selection: newValue.selection,
      );

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle input with numbers and mixed case', () {
      // Define a TextEditingValue with input text including numbers
      //and mixed case
      const oldValue = TextEditingValue(text: 'Hello123 World456');
      const newValue = TextEditingValue(text: 'Hello123 World456');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue = TextEditingValue(
        text: 'hello123 world456',
        selection: newValue.selection,
      );

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });
  });
}
