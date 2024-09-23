import 'package:main_text_field/src/translation/validation_localizations.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isPhoneValid(String phone) {
  return RegExp(r"^(?:[+0]9)?[0-9]{10,12}$").hasMatch(phone);
}

ValidationMessage? phoneValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(
      key: "can_not_be_empty",
    );
  } else if (int.tryParse(value.trim()) == null || !isPhoneValid(value)) {
    return ValidationMessage(
      key: 'invalid_phone_warning',
    );
  }
  // if (!value.startsWith("+") || value.length < 8) {
  // else if (value.length < 8) {
  //   return "invalid_phone_warning";
  // }

  return null;
}

ValidationMessage? isEmptyValidation(String? value) {
  if (value == null || value.isEmpty || int.tryParse(value.trim()) == 0) {
    return ValidationMessage(key: "");
  }
  return null;
}

ValidationMessage? numberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty");
  } else if (int.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value');
  }
  return null;
}

ValidationMessage? timeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty");
  } else if (int.tryParse(value.trim()) == 0) {
    return ValidationMessage(key: 'can_not_be_zero');
  }
  return null;
}

ValidationMessage? otpValidation(String? value) {
  if (value == null || value.length < 4) {
    return ValidationMessage(key: "please_enter_valid_code");
  }
  return null;
}

const emailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
// r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

ValidationMessage? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty");
  }
  if (!value.contains("@") ||
      !value.contains(".") ||
      value.length < 8 ||
      !RegExp(emailRegex).hasMatch(value)) {
    return ValidationMessage(key: 'invalid_email_with_example');
  }
  return null;
}

ValidationMessage? passwordValidation(String? value) {
  // if (value!.trim().length < 8) {
  //   return "minimum_length_is_8_characters";
  // }
  final RegExp rex = RegExp("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)");
  if (value!.trim().length < 8 || !rex.hasMatch(value.trim())) {
    return ValidationMessage(key: "password_format");
  }
  return null;
}

ValidationMessage? confirmPasswordValidation({
  required String? confirmPassword,
  required String? password,
}) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return ValidationMessage(key: "can_not_be_empty");
  } else if (confirmPassword.trim() != password!.trim()) {
    return ValidationMessage(key: "password_not_match");
  }

  return null;
}

ValidationMessage? titleValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? codeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  } else if (value.trim().length < 4) {
    return ValidationMessage(key: 'must_be_greater_than_three_digits');
  } else if (value.trim().length > 10) {
    return ValidationMessage(key: 'must_be_less_than_eleven_digits');
  }
  return null;
}

ValidationMessage? arabicValidation(String? value) {
  final RegExp rex = RegExp(r'^[\u0600-\u06FF\u0660-\u0669\\s0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return ValidationMessage(key: "only_arabic_letters");
  }
  return null;
}

ValidationMessage? englishValidation(String? value) {
  final RegExp rex = RegExp(r'^[a-zA-Z0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return ValidationMessage(key: "only_english_letters");
  }
  return null;
}

ValidationMessage? reportIdValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? equipmentValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? equipmentCodeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? actionValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? noValidation(String? value) {
  return null;
}

ValidationMessage? maintainedByValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? invoiceNumberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  }
  return null;
}

ValidationMessage? costValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value');
  } else if (double.parse(value.trim()) < 0) {
    return ValidationMessage(key: 'value_be_greater_than_zero');
  }
  return null;
}

ValidationMessage? descriptionValidation(String? value) {
  if (value == null || value.isEmpty) {
    return ValidationMessage(key: 'can_not_be_empty');
  } else if (value.trim().length < 4) {
    return ValidationMessage(key: 'must_be_greater_than_three_digits');
  }
  return null;
}

ValidationMessage? priceValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: 'minimum_length_is_1_digit');
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value');
  } else if (double.parse(value.trim()) == 0) {
    return ValidationMessage(key: 'value_be_greater_than_zero');
  } else if (value.trim().split('.')[0].length > 7) {
    return ValidationMessage(key: 'max_length_is_7_digits');
  }
  return null;
}

ValidationMessage? vatValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: 'minimum_length_is_1_digit');
  } else if (double.tryParse(value.trim()) == null) {
    return ValidationMessage(key: 'invalid_value');
  } else if (value.trim().split('.')[0].length > 2) {
    return ValidationMessage(key: 'max_length_is_2_digits');
  }
  return null;
}

ValidationMessage? buySellPriceValidation(
  String? buyValue,
  String sellValue, {
  bool isSellPrice = false,
}) {
  if (buyValue != null && sellValue.isNotEmpty) {
    if (double.tryParse(sellValue.trim())! <
        double.tryParse(buyValue.trim())!) {
      return isSellPrice
          ? ValidationMessage(key: 'sell_more_than_buy')
          : ValidationMessage(key: 'buy_less_than_sell');
    }
  }
  return null;
}

ValidationMessage? rangeValidation(String? min, String? max) {
  if (min == null || min.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_min_price");
  }
  if (max == null || max.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_max_price");
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);

  if (doubleMin == null || doubleMin < 0) {
    return ValidationMessage(key: "please_enter_valid_price");
  }
  if (doubleMax == null || doubleMax < 0) {
    return ValidationMessage(key: "please_enter_valid_price");
  }
  if (doubleMin > doubleMax) {
    return ValidationMessage(key: "min < max");
  }
  return null;
}

ValidationMessage? salaryRangeValidation(
    String? value, String? min, String? max) {
  if (min == null || min.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_min_price");
  }
  if (max == null || max.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_the_max_price");
  }
  if (value == null || value.trim().isEmpty) {
    return ValidationMessage(key: "please_enter_valid_value");
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);
  final double? doubleValue = double.tryParse(value);

  if (doubleMin == null || doubleMin < 0) {
    return ValidationMessage(key: "please_enter_valid_price");
  }
  if (doubleMax == null || doubleMax < 0) {
    return ValidationMessage(key: "please_enter_valid_price");
  }
  if (doubleValue == null || doubleValue < 0) {
    return ValidationMessage(key: "please_enter_valid_value");
  }
  if (doubleValue > doubleMax || doubleValue < doubleMin) {
    return ValidationMessage(
        key: "${"salary_must_be_between"} $doubleMax and $doubleMin");
  }
  return null;
}
