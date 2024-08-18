// Import the Flutter test package and the CapitalizeTextFormatter

import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('CapitalizeTextFormatter', () {
    final formatter = CapitalizeTextFormatter();

    test('should capitalize the first letter of each word', () {
      // Define a TextEditingValue with some input text
      const oldValue = TextEditingValue(text: 'john doe');
      const newValue = TextEditingValue(text: 'john doe');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue =
          TextEditingValue(text: 'John Doe', selection: newValue.selection);

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should handle leading and trailing spaces correctly', () {
      // Define a TextEditingValue with input text
      //including leading and trailing spaces
      const oldValue = TextEditingValue(text: '  jane doe ');
      const newValue = TextEditingValue(text: '  jane doe ');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue =
          TextEditingValue(text: '  Jane Doe ', selection: newValue.selection);

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });

    test('should not alter already capitalized words', () {
      // Define a TextEditingValue with already capitalized words
      const oldValue = TextEditingValue(text: 'Alice Wonderland');
      const newValue = TextEditingValue(text: 'Alice Wonderland');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue = TextEditingValue(
        text: 'Alice Wonderland',
        selection: newValue.selection,
      );

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

    test('should handle input with multiple spaces between words', () {
      // Define a TextEditingValue with multiple spaces between words
      const oldValue = TextEditingValue(text: 'hello    world');
      const newValue = TextEditingValue(text: 'hello    world');

      // Apply the formatter
      final result = formatter.formatEditUpdate(oldValue, newValue);

      // Define the expected result
      final expectedValue = TextEditingValue(
        text: 'Hello    World',
        selection: newValue.selection,
      );

      // Check if the formatter output matches the expected result
      expect(result.text, equals(expectedValue.text));
    });
  });
}
