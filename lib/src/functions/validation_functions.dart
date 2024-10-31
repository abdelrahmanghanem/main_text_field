import 'package:smart_localize/smart_localize.dart';

/// Validates the format of an email address.
///
/// The email must be at least 8 characters long and match a valid email format.
///
/// - Parameters:
///   - [value]: The input email address.
///   - [context]: The current BuildContext for localization.
///
/// - Returns: A localized error message if the email is invalid, or null if valid.
String? validateEmailFormat(String? value) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  if (trimmedValue.length < 8) {
    return SmartLocalizeValidation.emailMustBe8Characters;
  }

  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";

  if (!RegExp(emailRegex).hasMatch(trimmedValue)) {
    return SmartLocalizeValidation.invalidEmailWithExample;
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
String? validatePhoneFormat(String? value) {
  const phoneRegex = r"^\+?[0-9]{10,12}$";
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  if (!RegExp(phoneRegex).hasMatch(trimmedValue)) {
    return SmartLocalizeValidation.phoneWarning;
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
String? validateNonEmptyFormat(String? value) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty || int.tryParse(trimmedValue) == 0) {
    return SmartLocalizeValidation.cannotBeEmptyOrZero;
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
String? validateNumberFormat(String? value) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  if (double.tryParse(trimmedValue) == null) {
    return SmartLocalizeValidation.invalidNumberValue;
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
// String? validatePasswordFormat(String? value, BuildContext context) {
//   String trimmedValue = value?.trim() ?? '';
//   final RegExp rex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
//
//   if (trimmedValue.length < 8 || !rex.hasMatch(trimmedValue)) {
//     return ValidationMessage(key: "password_format").localize(context) ??
//         '"* Password must contain at least\n\n • Minimum length is 8 characters\n • 1 Capital letter and 1 small letter\n • 1 numbers\n • 1 special characters"';
//   }
//
//   return null;
// }
String? validatePasswordFormat(String? value) {
  String trimmedValue = value?.trim() ?? '';

  // List to hold all validation errors

  List<String> errorMessages = [];

  // Regular expressions for different checks

  final RegExp upperCaseRegExp = RegExp(r'[A-Z]');

  final RegExp lowerCaseRegExp = RegExp(r'[a-z]');

  final RegExp digitRegExp = RegExp(r'\d');

  final RegExp specialCharRegExp = RegExp(r'\W');

  // Perform checks and add error messages to the list if validation fails

  if (trimmedValue.isEmpty) {
    errorMessages.add(SmartLocalizeValidation.passwordEmpty);
  }

  if (trimmedValue.length < 8) {
    errorMessages.add(SmartLocalizeValidation.passwordLength);
  }

  if (!upperCaseRegExp.hasMatch(trimmedValue)) {
    errorMessages.add(SmartLocalizeValidation.passwordUppercase);
  }

  if (!lowerCaseRegExp.hasMatch(trimmedValue)) {
    errorMessages.add(SmartLocalizeValidation.passwordLowercase);
  }

  if (!digitRegExp.hasMatch(trimmedValue)) {
    errorMessages.add(SmartLocalizeValidation.passwordDigit);
  }

  if (!specialCharRegExp.hasMatch(trimmedValue)) {
    errorMessages.add(SmartLocalizeValidation.passwordSpecialChar);
  }

  // If there are errors, return them as a single string, otherwise return null

  if (errorMessages.isNotEmpty) {
    return errorMessages.join('\n');
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
}) {
  String trimmedConfirmPassword = confirmPassword?.trim() ?? '';
  String trimmedPassword = password?.trim() ?? '';

  if (trimmedConfirmPassword.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  if (trimmedConfirmPassword != trimmedPassword) {
    return SmartLocalizeValidation.passwordNotMatch;
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
String? validateDescription(String? value) {
  String trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  if (trimmedValue.length < 4) {
    return SmartLocalizeValidation.minLessThanMax;
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
String? validateArabic(String? value) {
  if (value == null || value.trim().isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  final RegExp rex = RegExp(r'^[\u0600-\u06FF\u0660-\u0669\s]+$');

  if (!rex.hasMatch(value.trim())) {
    return SmartLocalizeValidation.onlyArabicLetters;
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
String? validateEnglish(String? value) {
  if (value == null || value.trim().isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  final RegExp rex = RegExp(r'^[a-zA-Z0-9\s]+$');

  if (!rex.hasMatch(value.trim())) {
    return SmartLocalizeValidation.onlyEnglishLetters;
  }

  return null;
}

String? validateTimeFormat(String? value) {
  // Trim the input to avoid unnecessary spaces
  String trimmedValue = value?.trim() ?? '';

  // Check if the value is empty
  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  // Check if the value is a valid integer and not zero
  int? parsedValue = int.tryParse(trimmedValue);
  if (parsedValue == null || parsedValue == 0) {
    return SmartLocalizeValidation.cannotBeEmpty;
  }

  return null;
}

String? priceValidation(String? value) {
  // Trim the input once
  String trimmedValue = value?.trim() ?? '';

  // Check if the value is empty
  if (trimmedValue.isEmpty) {
    return SmartLocalizeValidation.minimumLengthIs1Digit;
  }

  // Try to parse the value as a double
  double? parsedValue = double.tryParse(trimmedValue);

  // Check if the value is a valid number
  if (parsedValue == null) {
    return SmartLocalizeValidation.invalidValue;
  }

  // Check if the value is greater than zero
  if (parsedValue == 0) {
    return SmartLocalizeValidation.valueBeGreaterThanZero;
  }

  // Check if the number before the decimal point exceeds 7 digits
  if (trimmedValue.split('.')[0].length > 7) {
    return SmartLocalizeValidation.maxLengthIs7Digits;
  }

  return null;
}
