import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart'; // Import your formatters
import 'package:text_input_formatter_kit_example/widgets/name_input.dart'; // Import your widget

void main() {
  testWidgets('NameInput widget test', (WidgetTester tester) async {
    // Build the NameInput widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NameInput(),
        ),
      ),
    );

    // Verify the TextField exists using find.byKey.
    const textFieldKey = Key('name_text_field');
    expect(find.byKey(textFieldKey), findsOneWidget);

    // Check if the TextField has the expected input formatters.
    final TextField textField = tester.widget(find.byKey(textFieldKey));
    final formatters = textField.inputFormatters;

    expect(formatters?.length, 3);
    expect(formatters?[0] is CapitalizeTextFormatter, isTrue);
    expect(
      formatters?[1] is NoEmojiTextInputFormatter,
      isTrue,
    ); // Confirm NoEmojiTextInputFormatter is not tested here
    expect(
      formatters?[2] is RestrictDigitsAndSpecialCharactersTextInputFormatter,
      isTrue,
    );

    // Verify the CapitalizeTextFormatter behavior
    await tester.enterText(find.byKey(textFieldKey), 'john doe');
    await tester.pump(); // Ensure the state updates

    // Fetch the actual text from the TextField's controller
    final actualText =
        tester.widget<TextField>(find.byKey(textFieldKey)).controller!.text;

    // Verify that the text is capitalized
    expect(actualText, 'John Doe');

    // Simulate tapping outside to unfocus the TextField.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();
  });
}

Future<void> clearTextField(WidgetTester tester, Key textFieldKey) async {
  final TextField textField = tester.widget(find.byKey(textFieldKey));
  textField.controller?.clear();
  await tester.pump(); // Rebuild the widget to reflect the changes
}
