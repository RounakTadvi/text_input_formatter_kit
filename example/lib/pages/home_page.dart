import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_input_formatter_kit_example/widgets/email_input.dart';
import 'package:text_input_formatter_kit_example/widgets/name_input.dart';
import 'package:text_input_formatter_kit_example/widgets/phone_number_input.dart';
import 'package:text_input_formatter_kit_example/widgets/username_input.dart';

/// A StatelessWidget that represents the home page of the app.
///
/// This page demonstrates the usage of various custom `TextInputFormatter`
/// implementations in a form. The form includes input fields for a name,
/// username, email, and phone number. Each field is formatted using a
/// specific `TextInputFormatter` from the `text_input_formatter_kit` package.
class HomePage extends StatelessWidget {
  // ignore: public_member_api_docs
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text Input Formatter Example',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  '''Capitalizes Every word, restricts Emojis, numerics and special characters''',
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Name input field with custom text formatting
              NameInput(),
              const Gap(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  '''Replaces whitespace with underscore for username''',
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Username input field with custom text formatting
              UsernameInput(),
              const Gap(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  '''Convert all characters to lowercase and restricts emojis''',
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Email input field with custom text formatting
              EmailInput(),
              const Gap(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  '''Adds whitespace after every 5 characters''',
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Phone number input field with custom text formatting
              PhoneNumberInput(),
              const Gap(),
            ],
          ),
        ),
      ),
    );
  }
}

/// A simple widget that provides a vertical gap of 8 pixels.
///
/// This widget is used to separate the input fields in the `HomePage`.
class Gap extends StatelessWidget {
  // ignore: public_member_api_docs
  const Gap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
