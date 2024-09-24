import 'package:flutter/cupertino.dart';
import 'package:main_text_field/src/translation/validation_localizations.dart';

/// Validates the format of an email address.
///
/// The email must be at least 8 characters long and match a valid email format.
///
/// - Parameters:
///   - [value]: The input email address.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the email is invalid, or null if valid.
String? validateEmailFormat(String? value, BuildContext context) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  if (trimmedValue.length < 8) {
    return ValidationMessage(key: 'invalid_email_with_example')
            .localize(context) ??
        'Email must be at least 8 characters long';
  }

  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";

  if (!RegExp(emailRegex).hasMatch(trimmedValue)) {
    return ValidationMessage(key: 'invalid_email_with_example')
            .localize(context) ??
        'Invalid email format. Example: example@example.com';
  }

  return null;
}

/// Validates the format of a phone number.
///
/// The phone number must contain between 10 and 12 digits and may start with '+'.
///
/// - Parameters:
///   - [value]: The input phone number.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the phone number is invalid, or null if valid.
String? validatePhoneFormat(String? value, BuildContext context) {
  const phoneRegex = r"^\+?[0-9]{10,12}$";
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  if (!RegExp(phoneRegex).hasMatch(trimmedValue)) {
    return ValidationMessage(key: 'invalid_phone_warning').localize(context) ??
        'Invalid phone number. Must be 10-12 digits.';
  }

  return null;
}

/// Validates that the input is not empty or zero.
///
/// This is commonly used for non-empty fields like quantity or other numeric inputs.
///
/// - Parameters:
///   - [value]: The input value.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the input is empty or zero, or null if valid.
String? validateNonEmptyFormat(String? value, BuildContext context) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty || int.tryParse(trimmedValue) == 0) {
    return ValidationMessage(key: "can_not_be_empty_or_zero")
            .localize(context) ??
        'Field cannot be empty or zero';
  }

  return null;
}

/// Validates that the input is a valid number (integer or decimal).
///
/// - Parameters:
///   - [value]: The input value.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the input is not a valid number, or null if valid.
String? validateNumberFormat(String? value, BuildContext context) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  if (double.tryParse(trimmedValue) == null) {
    return ValidationMessage(key: 'invalid_number_value').localize(context) ??
        'Invalid number value';
  }

  return null;
}

/// Validates that the password meets security criteria.
///
/// The password must be at least 8 characters long and contain at least one
/// digit, one lowercase letter, one uppercase letter, and one special character.
///
/// - Parameters:
///   - [value]: The input password.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the password is invalid, or null if valid.
String? validatePasswordFormat(String? value, BuildContext context) {
  String trimmedValue = value?.trim() ?? '';
  final RegExp rex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  if (trimmedValue.length < 8 || !rex.hasMatch(trimmedValue)) {
    return ValidationMessage(key: "password_format").localize(context) ??
        '"* Password must contain at least\n\n • Minimum length is 8 characters\n • 1 Capital letter and 1 small letter\n • 1 numbers\n • 1 special characters"';
  }

  return null;
}

/// Validates that the confirmed password matches the original password.
///
/// - Parameters:
///   - [confirmPassword]: The input confirmation password.
///   - [password]: The original password to compare against.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the passwords do not match, or null if they match.
String? validateConfirmPasswordFormat({
  required String? confirmPassword,
  required String? password,
  required BuildContext context,
}) {
  String trimmedConfirmPassword = confirmPassword?.trim() ?? '';
  String trimmedPassword = password?.trim() ?? '';

  if (trimmedConfirmPassword.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  if (trimmedConfirmPassword != trimmedPassword) {
    return ValidationMessage(key: "password_not_match").localize(context) ??
        'Passwords do not match';
  }

  return null;
}

/// Validates that a description is not empty and has a minimum length of 4 characters.
///
/// - Parameters:
///   - [value]: The input description string.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the description is invalid, or null if valid.
String? validateDescription(String? value, BuildContext context) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Field cannot be empty';
  }

  if (trimmedValue.length < 4) {
    return ValidationMessage(key: 'must_be_greater_than_three_digits')
            .localize(context) ??
        'Length must be greater than three characters';
  }

  return null;
}

/// Validates that the input contains only Arabic letters, Arabic numbers, or spaces.
///
/// The input must not be empty, and only Arabic letters (Unicode range \u0600-\u06FF),
/// Arabic numbers (\u0660-\u0669), or spaces are allowed.
///
/// - Parameters:
///   - [value]: The input string to validate.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the input is invalid, or null if valid.
String? validateArabic(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  final RegExp rex = RegExp(r'^[\u0600-\u06FF\u0660-\u0669\s]+$');

  if (!rex.hasMatch(value.trim())) {
    return ValidationMessage(key: "only_arabic_letters").localize(context) ??
        'Only Arabic letters and numbers are allowed';
  }

  return null;
}

/// Validates that the input contains only English letters, numbers, or spaces.
///
/// The input must not be empty, and only English letters (a-z, A-Z), numbers (0-9),
/// or spaces are allowed.
///
/// - Parameters:
///   - [value]: The input string to validate.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the input is invalid, or null if valid.
String? validateEnglish(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  final RegExp rex = RegExp(r'^[a-zA-Z0-9\s]+$');

  if (!rex.hasMatch(value.trim())) {
    return ValidationMessage(key: "only_english_letters").localize(context) ??
        'Only English letters, numbers, and spaces are allowed';
  }

  return null;
}

String? validateTimeFormat(String? value, BuildContext context) {
  // Trim the input to avoid unnecessary spaces
  String trimmedValue = value?.trim() ?? '';

  // Check if the value is empty
  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Field cannot be empty';
  }

  // Check if the value is a valid integer and not zero
  int? parsedValue = int.tryParse(trimmedValue);
  if (parsedValue == null || parsedValue == 0) {
    return ValidationMessage(key: 'can_not_be_zero').localize(context) ??
        'Can not be zero';
  }

  return null;
}

String? priceValidation(String? value, BuildContext context) {
  // Trim the input once
  String trimmedValue = value?.trim() ?? '';

  // Check if the value is empty
  if (trimmedValue.isEmpty) {
    return ValidationMessage(key: 'minimum_length_is_1_digit')
            .localize(context) ??
        'Minimum length is 1 digit';
  }

  // Try to parse the value as a double
  double? parsedValue = double.tryParse(trimmedValue);

  // Check if the value is a valid number
  if (parsedValue == null) {
    return ValidationMessage(key: 'invalid_value').localize(context) ??
        'Invalid value';
  }

  // Check if the value is greater than zero
  if (parsedValue == 0) {
    return ValidationMessage(key: 'value_be_greater_than_zero')
            .localize(context) ??
        'Value must be greater than zero';
  }

  // Check if the number before the decimal point exceeds 7 digits
  if (trimmedValue.split('.')[0].length > 7) {
    return ValidationMessage(key: 'max_length_is_7_digits').localize(context) ??
        'Maximum length is 7 digits before the decimal point';
  }

  return null;
}
