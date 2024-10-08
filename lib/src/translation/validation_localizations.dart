import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This class handles the localization of validation messages based on the current locale.
///
/// The class loads the appropriate JSON file for the locale and provides methods
/// to retrieve localized validation messages.
///
/// - [locale]: The locale for which the localizations will be loaded.
class ValidationLocalizations {
  final Locale locale;

  ValidationLocalizations(this.locale);

  /// Retrieves the [ValidationLocalizations] instance for the current [BuildContext].
  ///
  /// - Parameters:
  ///   - [context]: The current BuildContext.
  ///
  /// - Returns: The [ValidationLocalizations] instance or null if not found.
  static ValidationLocalizations? of(BuildContext context) {
    return Localizations.of<ValidationLocalizations>(
      context,
      ValidationLocalizations,
    );
  }

  /// A delegate for loading the localized validation messages.
  ///
  /// This delegate is required to integrate with Flutter's localization system.
  static const LocalizationsDelegate<ValidationLocalizations> delegate =
      _ValidationLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  /// Loads the localized strings from a JSON file based on the current locale.
  ///
  /// The JSON file must be located in the `translation` directory, named with
  /// the locale code (e.g., "en.json" for English).
  ///
  /// - Returns: A [Future] that completes with `true` when the loading is complete.
  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'packages/main_text_field/src/translation/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  /// Retrieves the localized message for the given key.
  ///
  /// - Parameters:
  ///   - [key]: The key for the validation message.
  ///
  /// - Returns: The localized string for the key, or null if the key is not found.
  String? translate(String? key) {
    return _localizedStrings[key!];
  }
}

/// A delegate class responsible for loading [ValidationLocalizations] based on the current locale.
///
/// This delegate helps in managing different languages for validation messages
/// by loading the respective localization files.
class _ValidationLocalizationsDelegate
    extends LocalizationsDelegate<ValidationLocalizations> {
  const _ValidationLocalizationsDelegate();

  /// Checks if the given locale is supported (currently "en" and "ar").
  ///
  /// - Parameters:
  ///   - [locale]: The locale to check.
  ///
  /// - Returns: `true` if the locale is supported, otherwise `false`.
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  /// Loads the [ValidationLocalizations] for the given locale.
  ///
  /// - Parameters:
  ///   - [locale]: The locale for which the localizations should be loaded.
  ///
  /// - Returns: A [Future] that completes with the loaded [ValidationLocalizations] instance.
  @override
  Future<ValidationLocalizations> load(Locale locale) async {
    ValidationLocalizations localizations = ValidationLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  /// Determines whether the localizations should be reloaded when the delegate changes.
  ///
  /// - Parameters:
  ///   - [old]: The old delegate to compare against.
  ///
  /// - Returns: `false` as reloading is not necessary.
  @override
  bool shouldReload(_ValidationLocalizationsDelegate old) => false;
}

/// This class represents a validation message, with support for localization.
///
/// - [key]: The key used to retrieve the localized message.
/// - [message]: The default message, which is used if no localized message is found.
class ValidationMessage {
  final String? key;
  String? message;

  ValidationMessage({
    this.key,
    this.message,
  });

  /// Localizes the validation message by looking up the key in the localizations.
  ///
  /// If the key is found, the localized message will be returned. If no localization is found,
  /// the default message is used instead.
  ///
  /// - Parameters:
  ///   - [context]: The current BuildContext used for localization.
  ///
  /// - Returns: The localized message or the default message if localization is not found.
  String? localize(BuildContext context) {
    message = ValidationLocalizations.of(context)?.translate(key) ?? message;
    return message;
  }
}
