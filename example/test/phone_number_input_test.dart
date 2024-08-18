import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart'; // Import your formatters
import 'package:text_input_formatter_kit_example/widgets/phone_number_input.dart'; // Import your widget

void main() {
  testWidgets('PhoneNumberInput widget test', (WidgetTester tester) async {
    // Build the PhoneNumberInput widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PhoneNumberInput(),
        ),
      ),
    );

    // Verify the TextField exists using find.byKey.
    const textFieldKey = Key('phone_number_text_field');
    expect(find.byKey(textFieldKey), findsOneWidget);

    // Check if the TextField has the expected input formatters.
    final TextField textField = tester.widget(
      find.byKey(textFieldKey),
    );
    final formatters = textField.inputFormatters;

    expect(formatters?.length, 3);
    expect(
      formatters?[0] is LengthLimitingTextInputFormatter,
      isTrue,
    );
    expect(
      formatters?[1] is FilteringTextInputFormatter,
      isTrue,
    );
    expect(
      formatters?[2] is SpacerInputFormatter,
      isTrue,
    );

    // Verify the input formatter constraints (e.g., max length).
    final LengthLimitingTextInputFormatter lengthFormatter =
        formatters![0] as LengthLimitingTextInputFormatter;
    expect(lengthFormatter.maxLength, 11);

    // Test the FilteringTextInputFormatter by entering various inputs
    await tester.enterText(find.byKey(textFieldKey), '987abc');
    await tester.pump(); // Ensure the state updates

    // Fetch the actual text from the TextField's controller
    final actualText =
        tester.widget<TextField>(find.byKey(textFieldKey)).controller?.text;

    // Verify that only digits are allowed
    expect(actualText, '987');

    // Test the input formatting functionality with spacing
    await tester.enterText(find.byKey(textFieldKey), '1234567890');
    await tester.pump(); // Ensure the state updates

    final formattedText =
        tester.widget<TextField>(find.byKey(textFieldKey)).controller!.text;

    // Verify the text with formatting applied (spaces every 5 digits)
    expect(
      formattedText,
      '12345 67890',
    ); // Adjust this according to your implementation of SpacerInputFormatter

    // Simulate tapping outside to unfocus the TextField.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();
  });
}
