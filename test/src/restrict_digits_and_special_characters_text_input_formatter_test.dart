// Import the necessary packages for testing
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('RestrictDigitsAndSpecialCharactersTextInputFormatter', () {
    final formatter = RestrictDigitsAndSpecialCharactersTextInputFormatter();

    test('should reject input with digits', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello123');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
    });

    test('should reject input with special characters', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello@World!');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
    });

    test('should allow input with only alphabetic characters', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'HelloWorld');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'HelloWorld');
    });

    test('should allow input with spaces', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello World');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello World');
    });

    test('should reject input with mixed digits and special characters', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'H3ll0_World!');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
    });

    test('should reject input with only digits', () {
      const oldValue = TextEditingValue(text: 'OldValue');
      const newValue = TextEditingValue(text: '1234567890');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'OldValue');
    });

    test('should allow input with only alphabetic characters and no spaces',
        () {
      const oldValue = TextEditingValue(text: 'OldValue');
      const newValue = TextEditingValue(text: 'NewValue');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'NewValue');
    });

    test('should maintain the cursor position after rejecting input', () {
      const oldValue = TextEditingValue(
        text: 'Hello',
        selection: TextSelection.collapsed(offset: 5),
      );
      const newValue = TextEditingValue(
        text: 'Hello123',
        selection: TextSelection.collapsed(offset: 8),
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
      expect(result.selection.baseOffset, 5);
    });

    test('should maintain the cursor position after allowing input', () {
      const oldValue = TextEditingValue(
        text: 'Hello',
        selection: TextSelection.collapsed(offset: 5),
      );
      const newValue = TextEditingValue(
        text: 'HelloWorld',
        selection: TextSelection.collapsed(offset: 10),
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'HelloWorld');
      expect(result.selection.baseOffset, 10);
    });
  });
}
