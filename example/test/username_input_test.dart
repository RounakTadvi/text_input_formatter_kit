import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';
import 'package:text_input_formatter_kit_example/widgets/username_input.dart'; // Import your formatters

void main() {
  testWidgets('UsernameInput widget test', (WidgetTester tester) async {
    // Build the UsernameInput widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UsernameInput(),
        ),
      ),
    );

    // Verify the TextField exists using find.byKey.
    const textFieldKey = Key('username_text_field');
    expect(find.byKey(textFieldKey), findsOneWidget);

    // Check if the TextField has the expected input formatters.
    final TextField textField = tester.widget(find.byKey(textFieldKey));
    final formatters = textField.inputFormatters;

    expect(formatters?.length, 3);
    expect(formatters?[0] is NoEmojiTextInputFormatter, isTrue);
    expect(formatters?[1] is LengthLimitingTextInputFormatter, isTrue);
    expect(formatters?[2] is ReplaceWhiteSpaceTextInputFormatter, isTrue);

    // Verify the LengthLimitingTextInputFormatter constraint.
    final LengthLimitingTextInputFormatter lengthFormatter =
        formatters![1] as LengthLimitingTextInputFormatter;
    expect(lengthFormatter.maxLength, 30);

    // Test the ReplaceWhiteSpaceTextInputFormatter
    // by entering text with white spaces.
    await tester.enterText(find.byKey(textFieldKey), 'user name');
    await tester.pump(); // Ensure the state updates

    // Fetch the actual text from the TextField's controller
    final replacedText =
        tester.widget<TextField>(find.byKey(textFieldKey)).controller!.text;

    // Verify that white spaces are replaced with underscores
    expect(replacedText, 'user_name');

    // Simulate tapping outside to unfocus the TextField.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();
  });
}
