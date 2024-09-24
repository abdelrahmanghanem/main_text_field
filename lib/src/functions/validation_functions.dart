import 'package:flutter/cupertino.dart';
import 'package:main_text_field/src/translation/validation_localizations.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isPhoneValid(String phone) {
  return RegExp(r"^(?:[+0]9)?[0-9]{10,12}$").hasMatch(phone);
}

String? phoneValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Can not be empty';
  } else if (int.tryParse(value.trim()) == null || !isPhoneValid(value)) {
    return ValidationMessage(key: 'invalid_phone_warning').localize(context) ??
        'Invalid phone warning';
  }
  // if (!value.startsWith("+") || value.length < 8) {
  // else if (value.length < 8) {
  //   return "invalid_phone_warning";
  // }

  return null;
}

String? isEmptyValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty || int.tryParse(value.trim()) == 0) {
    return ValidationMessage(key: "").localize(context) ?? 'Can not be empty';
  }
  return null;
}

String? numberValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Can not be empty';
  } else if (int.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value').localize(context) ??
        'Invalid value';
  }
  return null;
}

String? timeValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Can not be empty';
  } else if (int.tryParse(value.trim()) == 0) {
    return ValidationMessage(key: 'can_not_be_zero').localize(context) ??
        'Can not be zero';
  }
  return null;
}

String? otpValidation(String? value, BuildContext context) {
  if (value == null || value.length < 4) {
    return ValidationMessage(key: "please_enter_valid_code")
            .localize(context) ??
        'Please enter valid code';
  }
  return null;
}

const emailRegex =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";

String? emailValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Can not be empty';
  }
  if (!value.contains("@") ||
      !value.contains(".") ||
      value.length < 8 ||
      !RegExp(emailRegex).hasMatch(value)) {
    return ValidationMessage(key: 'invalid_email_with_example')
            .localize(context) ??
        'Invalid email with example';
  }

  return null;
}

String? passwordValidation(String? value, BuildContext context) {
  // if (value!.trim().length < 8) {
  //   return "minimum_length_is_8_characters";
  // }
  final RegExp rex = RegExp("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)");
  if (value!.trim().length < 8 || !rex.hasMatch(value.trim())) {
    return ValidationMessage(key: "password_format").localize(context) ??
        'Password format';
  }
  return null;
}

String? confirmPasswordValidation({
  required String? confirmPassword,
  required String? password,
  required BuildContext context,
}) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty").localize(context) ??
        'Can not be empty';
  } else if (confirmPassword.trim() != password!.trim()) {
    return ValidationMessage(key: "password_not_match").localize(context) ??
        'Password not match';
  }

  return null;
}

String? titleValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? codeValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  } else if (value.trim().length < 4) {
    return ValidationMessage(key: 'must_be_greater_than_three_digits')
            .localize(context) ??
        'Must be greater than three digits';
  } else if (value.trim().length > 10) {
    return ValidationMessage(key: 'must_be_less_than_eleven_digits')
            .localize(context) ??
        'Must be less than eleven digits';
  }
  return null;
}

String? arabicValidation(String? value, BuildContext context) {
  final RegExp rex = RegExp(r'^[\u0600-\u06FF\u0660-\u0669\\s0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return ValidationMessage(key: "only_arabic_letters").localize(context) ??
        'Only Arabic letters';
  }
  return null;
}

String? englishValidation(String? value, BuildContext context) {
  final RegExp rex = RegExp(r'^[a-zA-Z0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return ValidationMessage(key: "only_english_letters").localize(context) ??
        'Only english letters';
  }
  return null;
}

String? reportIdValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? equipmentValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? equipmentCodeValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? actionValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? noValidation(String? value, BuildContext context) {
  return null;
}

String? maintainedByValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? invoiceNumberValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  }
  return null;
}

String? costValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value').localize(context) ??
        'Invalid value';
  } else if (double.parse(value.trim()) < 0) {
    return ValidationMessage(key: 'value_be_greater_than_zero')
            .localize(context) ??
        'Value be greater than zero';
  }
  return null;
}

String? descriptionValidation(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty').localize(context) ??
        'Can not be empty';
  } else if (value.trim().length < 4) {
    return ValidationMessage(key: 'must_be_greater_than_three_digits')
            .localize(context) ??
        'Must be greater than three digits';
  }
  return null;
}

String? priceValidation(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: 'minimum_length_is_1_digit')
            .localize(context) ??
        'Minimum length is 1 digit';
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value').localize(context) ??
        'Invalid value';
  } else if (double.parse(value.trim()) == 0) {
    return ValidationMessage(key: 'value_be_greater_than_zero')
            .localize(context) ??
        'Value be greater than zero';
  } else if (value.trim().split('.')[0].length > 7) {
    return ValidationMessage(key: 'max_length_is_7_digits').localize(context) ??
        'Max length is 7 digits';
  }
  return null;
}

String? vatValidation(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: 'minimum_length_is_1_digit')
            .localize(context) ??
        'Minimum length is 1 digit';
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value').localize(context) ?? '';
  } else if (value.trim().split('.')[0].length > 2) {
    return ValidationMessage(key: 'max_length_is_2_digits').localize(context) ??
        '';
  }
  return null;
}

String? buySellPriceValidation(
  String? buyValue,
  BuildContext context,
  String sellValue, {
  bool isSellPrice = false,
}) {
  if (buyValue != null && sellValue.isNotEmpty) {
    if (double.tryParse(sellValue.trim())! <
        double.tryParse(buyValue.trim())!) {
      return isSellPrice
          ? ValidationMessage(key: 'sell_more_than_buy').localize(context) ?? ''
          : ValidationMessage(key: 'buy_less_than_sell').localize(context) ??
              '';
    }
  }
  return null;
}

String? rangeValidation(String? min, String? max, BuildContext context) {
  if (min == null || min.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_min_price")
            .localize(context) ??
        '';
  }
  if (max == null || max.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_max_price")
            .localize(context) ??
        '';
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);

  if (doubleMin == null || doubleMin < 0) {
    return ValidationMessage(key: "please_enter_valid_price")
            .localize(context) ??
        '';
  }
  if (doubleMax == null || doubleMax < 0) {
    return ValidationMessage(key: "please_enter_valid_price")
            .localize(context) ??
        '';
  }
  if (doubleMin > doubleMax) {
    return ValidationMessage(key: "min < max").localize(context) ?? '';
  }
  return null;
}

String? salaryRangeValidation(
    String? value, String? min, String? max, BuildContext context) {
  if (min == null || min.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_min_price")
            .localize(context) ??
        '';
  }
  if (max == null || max.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_max_price")
            .localize(context) ??
        '';
  }
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_valid_value")
            .localize(context) ??
        '';
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);
  final double? doubleValue = double.tryParse(value);

  if (doubleMin == null || doubleMin < 0) {
    return ValidationMessage(key: "please_enter_valid_price")
            .localize(context) ??
        '';
  }
  if (doubleMax == null || doubleMax < 0) {
    return ValidationMessage(key: "please_enter_valid_price")
            .localize(context) ??
        '';
  }
  if (doubleValue == null || doubleValue < 0) {
    return ValidationMessage(key: "please_enter_valid_value")
            .localize(context) ??
        '';
  }
  if (doubleValue > doubleMax || doubleValue < doubleMin) {
    return ValidationMessage(
                key: "${"salary_must_be_between"} $doubleMax and $doubleMin")
            .localize(context) ??
        '';
  }
  return null;
}
