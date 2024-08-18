import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';
import 'package:text_input_formatter_kit_example/widgets/email_input.dart';

void main() {
  testWidgets('EmailInput widget test', (WidgetTester tester) async {
    // Build the EmailInput widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailInput(),
        ),
      ),
    );

    // Verify the TextField exists by using find.byKey.
    expect(find.byKey(const Key('email_text_field')), findsOneWidget);

    // Check if the TextField has the expected input formatters.
    final TextField textField =
        tester.widget(find.byKey(const Key('email_text_field')));
    expect(textField.inputFormatters?.length, 2);
    expect(textField.inputFormatters?[0] is NoEmojiTextInputFormatter, isTrue);
    expect(textField.inputFormatters?[1] is LowerCaseTextFormatter, isTrue);

    // Check the initial decoration properties.
    final InputDecoration decoration = textField.decoration!;
    expect(decoration.hintText, 'Enter Email');
    expect(decoration.hintStyle?.fontSize, 14);
    expect(decoration.filled, isTrue);
    expect(decoration.fillColor, Colors.white);

    // Check the onChanged callback.
    await tester.enterText(
      find.byKey(const Key('email_text_field')),
      'TEST@EMAIL.COM',
    );

    // Verify the text has been transformed to lowercase.
    expect(find.text('test@email.com'), findsOneWidget);

    // Simulate tapping outside to unfocus the TextField.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();
  });
}
