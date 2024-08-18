// Import the necessary packages for testing
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('SpacerInputFormatter', () {
    test(
        '''should format text by adding a space after every specified number of characters''',
        () {
      final formatter = SpacerInputFormatter(spaceEvery: 4);
      const oldValue = TextEditingValue(text: '12345678');
      const newValue = TextEditingValue(text: '12345678');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1234 5678');
    });

    test('should handle shorter input than spaceEvery without adding spaces',
        () {
      final formatter = SpacerInputFormatter(spaceEvery: 4);
      const oldValue = TextEditingValue(text: '123');
      const newValue = TextEditingValue(text: '123');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123');
    });

    test('should handle text length that is exactly a multiple of spaceEvery',
        () {
      final formatter = SpacerInputFormatter(spaceEvery: 3);
      const oldValue = TextEditingValue(text: '123456');
      const newValue = TextEditingValue(text: '123456');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123 456');
    });

    test('should maintain correct cursor position after formatting', () {
      final formatter = SpacerInputFormatter(spaceEvery: 4);
      const oldValue = TextEditingValue(
        text: '1234',
        selection: TextSelection.collapsed(offset: 4),
      );
      const newValue = TextEditingValue(
        text: '12345',
        selection: TextSelection.collapsed(offset: 5),
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1234 5');
      expect(result.selection.baseOffset, 6);
    });

    test('should throw an ArgumentError if spaceEvery is less than 1', () {
      expect(() => SpacerInputFormatter(spaceEvery: 0), throwsArgumentError);
    });

    test('should not add space if the input text is empty', () {
      final formatter = SpacerInputFormatter(spaceEvery: 4);
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue.empty;

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });
  });
}
