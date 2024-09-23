import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidationLocalizations {
  final Locale locale;

  ValidationLocalizations(this.locale);

  static ValidationLocalizations? of(BuildContext context) {
    return Localizations.of<ValidationLocalizations>(
      context,
      ValidationLocalizations,
    );
  }

  static const LocalizationsDelegate<ValidationLocalizations> delegate =
      _ValidationLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'packages/main_text_field/src/translation/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String? key) {
    return _localizedStrings[key!];
  }
}

class _ValidationLocalizationsDelegate
    extends LocalizationsDelegate<ValidationLocalizations> {
  const _ValidationLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<ValidationLocalizations> load(Locale locale) async {
    ValidationLocalizations localizations = ValidationLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_ValidationLocalizationsDelegate old) => false;
}

class ValidationMessage {
  final String? key;
  String? message;
  ValidationMessage({
    this.key,
    this.message,
  });
  String? localize(BuildContext context) {
    return ValidationLocalizations.of(context)?.translate(key) ?? message;
  }
}
