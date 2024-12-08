import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

void main() {
  group('NoLeadingWhitespaceFormatter', () {
    final formatter = NoLeadingWhitespaceFormatter();

    test('removes leading whitespace from input', () {
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue(text: '  Hello');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
      expect(result.selection, const TextSelection.collapsed(offset: 5));
    });

    test('keeps text unchanged if no leading whitespace', () {
      const oldValue = TextEditingValue(text: 'Hello');
      const newValue = TextEditingValue(text: 'Hello');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello');
      expect(result.selection, const TextSelection.collapsed(offset: 5));
    });

    test('removes multiple leading whitespaces', () {
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue(text: '   Flutter Test');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Flutter Test');
      expect(result.selection, const TextSelection.collapsed(offset: 12));
    });

    test('handles empty string input', () {
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue.empty;

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
      expect(result.selection, const TextSelection.collapsed(offset: 0));
    });

    test('does not affect whitespace within the text', () {
      const oldValue = TextEditingValue.empty;
      const newValue = TextEditingValue(text: 'Hello World');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, 'Hello World');
      expect(result.selection, const TextSelection.collapsed(offset: 11));
    });
  });
}
