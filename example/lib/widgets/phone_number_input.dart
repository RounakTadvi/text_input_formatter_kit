import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

class PhoneNumberInput extends StatelessWidget {
  PhoneNumberInput();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('phone_number_text_field'),
      controller: _controller,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(
          11,
        ),
        FilteringTextInputFormatter.digitsOnly,
        SpacerInputFormatter(
          spaceEvery: 5,
        ),
      ],
      autocorrect: false,
      style: GoogleFonts.rubik(
        fontSize: 16,
        color: Colors.black,
      ),
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '+91',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 1,
                height: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
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
        hintText: 'Enter 10 digit Mobile Number',
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
