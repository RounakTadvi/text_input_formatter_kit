# 🎨 Text Input Formatter Kit

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![codecov](https://codecov.io/gh/RounakTadvi/text_input_formatter_kit/branch/main/graph/badge.svg?token=74GHL9G2R1)](https://codecov.io/gh/RounakTadvi/text_input_formatter_kit)
[![License: MIT][license_badge]][license_link]

**text_input_formatter_kit** is a lightweight and utility-driven package offering custom TextInputFormatter implementations to enhance and standardize user input in Flutter forms.

## Features ✨

- **CapitalizeTextFormatter**: Capitalizes the first letter of each word in the input text. 🅰️
- **LowerCaseTextFormatter**: Converts all input text to lowercase. 🔠
- **NoEmojiTextInputFormatter**: Restricts input to exclude emojis. 🚫😊
- **ReplaceWhiteSpaceTextInputFormatter**: Replaces all spaces with a specified character. 🔄
- **RestrictDigitsAndSpecialCharactersTextInputFormatter**: Excludes digits and special characters. 🚫🔢
- **SpacerInputFormatter**: Adds a space after every specified number of characters. 🔢🔠

## Getting Started 💻

**❗ In order to start using Text Input Formatter Kit you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add text_input_formatter_kit
```

```dart
import 'package:text_input_formatter_kit/text_input_formatter_kit.dart';

TextField(
  inputFormatters: <TextInputFormatter>[
    // Capitalizes the first letter of each word
    CapitalizeTextFormatter(), 

    // Converts all input text to lowercase
    LowerCaseTextFormatter(),  

    // Restricts input to exclude emojis
    NoEmojiTextInputFormatter(),  

    // Replaces spaces with underscore
    ReplaceWhiteSpaceTextInputFormatter(replacementChar: '_'), 

    // Excludes digits and special characters
    RestrictDigitsAndSpecialCharactersTextInputFormatter(),  

    // Adds a space after every 4 characters
    SpacerInputFormatter(spaceEvery: 4),  
  ],
);

```

## Contribution 🤝

Contributions are welcome! If you have suggestions for new formatters or improvements to existing ones, feel free to create an issue or submit a pull request.

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
