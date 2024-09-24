import 'package:flutter/material.dart';

import '../widgets/label_required_widget.dart';
import 'get_outline_input_border.dart';

/// Enum to specify the type of input decoration.
///
/// - `outline`: The input field will have an outline border.
/// - `underLine`: The input field will have an underline border.
/// - `filled`: The input field will have a filled background with an outline border.
enum DecorationType {
  outline,
  underLine,
  filled,
}

/// Returns an `InputDecoration` based on the specified `DecorationType`.
///
/// This function provides different decoration styles (`outline`, `underline`, `filled`)
/// depending on the specified decoration type. It also allows for customization
/// of various properties such as icons, label text, hint text, padding, etc.
///
/// - Parameters:
///   - [decorationType]: The type of input decoration to apply (outline, underLine, filled).
///   - [context]: The current `BuildContext`, used to access theme properties.
///   - [filled]: Whether the input field should be filled with a background color.
///   - [fillColor]: The background color for the filled input field.
///   - [border]: The color for the border when the input is enabled or focused.
///   - [isEnable]: Whether the input field is enabled or not.
///   - [labelText]: The label text to display above the input field.
///   - [hintText]: The hint text to display inside the input field.
///   - [prefixIcon]: A widget to display before the input text (usually an icon).
///   - [suffixIcon]: A widget to display after the input text (usually an icon).
///   - [contentPadding]: The padding inside the input field.
///   - [prefixIconConstraints]: Constraints for the prefix icon's size and position.
///   - [suffixIconConstraints]: Constraints for the suffix icon's size and position.
///   - [showAsterisk]: Whether to show an asterisk (*) for required fields (default is true).
///   - [labelColor]: The color of the label text.
///   - [error]: The color to use for the error border and error text.
///   - [isDense]: Whether to make the input field dense (compact spacing).
///   - [isRequired]: Whether the input field is required (shows an asterisk if `true`).
///   - [hintStyle]: The text style for the hint text.
///
/// - Returns: An `InputDecoration` object with the appropriate configuration for the input field.
InputDecoration getInputDecoration({
  required DecorationType decorationType,
  required BuildContext context,
  required bool? filled,
  required Color? fillColor,
  required Color border,
  required bool isEnable,
  required String? labelText,
  required String? hintText,
  required Widget? prefixIcon,
  required Widget? suffixIcon,
  required EdgeInsetsGeometry? contentPadding,
  required BoxConstraints? prefixIconConstraints,
  required BoxConstraints? suffixIconConstraints,
  bool showAsterisk = true,
  required Color? labelColor,
  required Color? error,
  bool isDense = false,
  bool isRequired = false,
  required TextStyle? hintStyle,
  required double radius,
}) {
  switch (decorationType) {
    case DecorationType.outline:
      final textTheme = Theme.of(context).textTheme;
      return InputDecoration(
        fillColor: fillColor,
        filled: filled,
        isDense: isDense,
        enabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        focusedBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        disabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        border: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        label: labelText != null
            ? LabelRequiredWidget(
                label: labelText,
                isRequired: (isRequired && showAsterisk),
              )
            : null,
        counterText: '',
        errorMaxLines: 6,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        errorStyle: Theme.of(context)
            .inputDecorationTheme
            .errorStyle
            ?.copyWith(fontSize: 12),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: isEnable,
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle:
            textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800),
        labelStyle: textTheme.bodyMedium?.copyWith(color: labelColor),
        contentPadding: contentPadding ?? EdgeInsets.zero,
      );

    case DecorationType.underLine:
      final error = Theme.of(context).colorScheme.error;
      final textTheme = Theme.of(context).textTheme;
      return InputDecoration(
        filled: filled,
        fillColor: fillColor,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(vertical: 16),
        errorMaxLines: 6,
        errorStyle: Theme.of(context)
            .inputDecorationTheme
            .errorStyle
            ?.copyWith(fontSize: 14),
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        suffix: suffixIcon,
        enabled: isEnable,
        label: labelText != null
            ? LabelRequiredWidget(
                label: labelText,
                isRequired: (isRequired && showAsterisk),
              )
            : null,
        hintText: hintText,
        hintStyle: hintStyle ?? textTheme.bodyMedium,
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: labelColor,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: textTheme.bodyLarge,
        counterText: '',
      );

    case DecorationType.filled:
      final textTheme = Theme.of(context).textTheme;
      return InputDecoration(
        fillColor: fillColor,
        filled: filled,
        enabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        focusedBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        disabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        border: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
          radius: radius,
        ),
        counterText: '',
        errorMaxLines: 6,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        errorStyle: Theme.of(context)
            .inputDecorationTheme
            .errorStyle
            ?.copyWith(fontSize: 12),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: isEnable,
        label: labelText != null
            ? LabelRequiredWidget(
                label: labelText,
                isRequired: (isRequired && showAsterisk),
              )
            : null,
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle:
            textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800),
        labelStyle: textTheme.bodyMedium?.copyWith(color: labelColor),
        contentPadding: contentPadding ?? EdgeInsets.zero,
      );
  }
}
