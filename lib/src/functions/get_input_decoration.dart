import 'package:flutter/material.dart';

import '../widgets/label_required_widget.dart';
import 'get_outline_input_border.dart';

enum DecorationType {
  outline,
  underLine,
  filled,
}

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
  // HintTextDirection? hintTextDirection,
}) {
  switch (decorationType) {
    case DecorationType.outline:
      final textTheme = Theme.of(context).textTheme;
      return InputDecoration(
        fillColor: fillColor,
        // If `isUnderLineBorder` is false, use a different border style.
        filled: filled,
        isDense: isDense,
        enabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        disabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        border: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        // Label to display above the field when it is not empty.
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
        // If true, the field will have a background color.
        filled: filled,
        // Background color of the field.
        fillColor: fillColor,
        // Border displayed when the field is focused. Uses a default underline border if not provided.
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        // Border displayed when the field is enabled. Uses a default underline border if not provided.
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        // Border displayed when the field is disabled.
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        // Default border style.
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        // Border style when validation fails.
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: error),
        ),
        // Border style when the field is focused and validation fails.
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        // Padding inside the field. Defaults to a vertical padding of 16 if not provided.
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(vertical: 16),
        // Maximum number of lines for the error message.
        errorMaxLines: 6,
        // Style for the error message text.
        errorStyle: Theme.of(context)
            .inputDecorationTheme
            .errorStyle
            ?.copyWith(fontSize: 14),
        // Icon displayed before the input text.
        prefixIcon: prefixIcon,
        // Constraints for the prefix icon.
        prefixIconConstraints: prefixIconConstraints,
        // Constraints for the suffix icon.
        suffixIconConstraints: suffixIconConstraints,
        // Icon or widget displayed after the input text.
        suffix: suffixIcon,
        // If false, the field will be disabled and not interactable.
        enabled: isEnable,
        // Label to display above the field when it is not empty.
        label: labelText != null
            ? LabelRequiredWidget(
                label: labelText,
                isRequired: (isRequired && showAsterisk),
              )
            : null,

        // Hint text displayed inside the field when it is empty.
        hintText: hintText,
        // Style for the hint text.
        hintStyle: hintStyle ?? textTheme.bodyMedium,
        // Style for the label text.
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: labelColor,
        ),
        // Alignment of the floating label.
        floatingLabelAlignment: FloatingLabelAlignment.start,
        // Style for the floating label.
        floatingLabelStyle: textTheme.bodyLarge,
        // Text for character counter (empty by default).
        counterText: '',
      );

    case DecorationType.filled:
      final textTheme = Theme.of(context).textTheme;
      return InputDecoration(
        fillColor: fillColor,
        // If `isUnderLineBorder` is false, use a different border style.
        filled: filled,
        enabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        disabledBorder: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
        ),
        border: getOutlineInputBorder(
          color: Theme.of(context).primaryColor,
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
        // Label to display above the field when it is not empty.
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
