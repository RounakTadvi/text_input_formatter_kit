import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

class EmailInput extends StatelessWidget {
  EmailInput({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('email_text_field'),
      controller: _controller,
      inputFormatters: <TextInputFormatter>[
        NoEmojiTextInputFormatter(),
        LowerCaseTextFormatter(),
      ],
      onChanged: (value) {
        debugPrint('Email onChanged: $value');
      },
      style: GoogleFonts.rubik(
        fontSize: 16,
        color: Colors.black,
      ),
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        hintText: 'Enter Email',
        hintStyle: GoogleFonts.rubik(
          fontSize: 14,
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
      ),
    );
  }
}