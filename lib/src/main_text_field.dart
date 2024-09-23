import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'functions/get_input_decoration.dart';

/// A custom text form field widget that provides a variety of configurable options
/// including borders, icons, validation, and text input handling.
class MainTextFormField extends StatelessWidget {
  /// The width of the form field. If `null`, it takes up the available space.
  final double? width;

  /// The radius of the corners of the field. Defaults to `12`.
  final double radius;

  /// The maximum width of the form field.
  final double? maxWidth;

  /// The color of the label text. Defaults to the theme's color if `null`.
  final Color? labelColor;

  /// The minimum number of lines for the field. Defaults to `1`.
  final int minLines;

  /// The alignment of the text inside the form field. Defaults to `TextAlign.start`.
  final TextAlign? textAlign;

  /// The direction of the hint text.
  final TextDirection? hintTextDirection;

  /// The initial value of the form field when loaded.
  final String? initialValue;

  /// The type of keyboard to use for text input (e.g., text, number). Defaults to `TextInputType.text`.
  final TextInputType keyboardType;

  /// A function to validate the input. Returns an error message if validation fails.
  final String? Function(String? val)? validator;

  /// A callback function that saves the form field's value.
  final void Function(String? val)? onSave;

  /// A callback function triggered when the input text changes.
  final void Function(String)? onChanged;

  /// A callback triggered when the submit action occurs on the keyboard.
  final VoidCallback? onSubmit;

  /// A callback that triggers when the form field is tapped.
  final void Function()? onTap;

  /// The number of lines to display in the form field. Defaults to `1`.
  final int linesCount;

  /// A flag that determines if the keyboard should be closed when tapping outside the form field.
  final bool shouldCloseKeyboardOnTapOutside;

  /// A flag that defines whether the form field uses an underline border.
  final bool isUnderLineBorder;

  /// A flag that obscures the text input, commonly used for passwords. Defaults to `false`.
  final bool obscureText;

  /// A flag that makes the form field read-only. Defaults to `false`.
  final bool readOnly;

  /// The text style for the input text.
  final TextStyle? style;

  /// A `FocusNode` to manage focus for the form field.
  final FocusNode? focusNode;

  /// The maximum length of the input text.
  final int? maxLength;

  /// A `TextEditingController` to control the text input programmatically.
  final TextEditingController? controller;

  /// A custom decoration for the input field.
  final InputDecoration? decoration;

  /// The action button to show on the keyboard (e.g., "done", "next"). Defaults to `TextInputAction.next`.
  final TextInputAction? textInputAction;

  /// The vertical alignment of the text inside the form field. Defaults to `TextAlignVertical.center`.
  final TextAlignVertical? textAlignVertical;

  /// Determines when the field should validate its value (e.g., on user interaction). Defaults to `AutovalidateMode.disabled`.
  final AutovalidateMode? autovalidateMode;

  /// A list of input formatters to apply (e.g., restricting input to digits).
  final List<TextInputFormatter>? textInputFormatter;

  /// Controls how the text input should be capitalized (e.g., sentences, words).
  final TextCapitalization? textCapitalization;
  //   inputDecoration: InputDecoration

  /// A flag that marks the form field as required for validation purposes.
  final bool isRequired;

  /// A flag to determine whether the form field should be filled with a background color.
  final bool? filled;

  /// Padding around the content of the form field.
  final EdgeInsets? contentPadding;

  /// The background color of the form field.
  final Color? fillColor;

  /// The border when the field is focused.
  final InputBorder? focusedBorder;

  /// A widget to display as a prefix icon inside the form field.
  final Widget? prefixIcon;

  /// Constraints for the prefix icon (e.g., size).
  final BoxConstraints? prefixIconConstraints;

  /// Constraints for the prefix icon (e.g., size).
  final BoxConstraints? suffixIconConstraints;

  /// The border when the field is enabled.
  final InputBorder? enabledBorder;

  /// A widget to display as a suffix icon inside the form field.
  final Widget? suffixIcon;

  /// The label text displayed above the form field.
  final String? label;

  /// Hint text displayed inside the field when it is empty.
  final String? hintText;

  /// A flag to control whether the form field is rendered densely.
  final bool isDense;

  /// The style for the hint text inside the field.
  final TextStyle? hintStyle;

  /// A flag that enables or disables the form field. Defaults to `true` (enabled).
  final bool isEnable;

  /// A flag to show an asterisk (*) next to the label for required fields. Defaults to `true`.
  final bool showAsterisk;

  final DecorationStyleType decorationStyleType;
  const MainTextFormField({
    super.key,
    this.width,
    this.radius = 12,
    this.minLines = 1,
    this.textInputFormatter,
    this.labelColor,
    this.isUnderLineBorder = true,
    this.shouldCloseKeyboardOnTapOutside = true,
    this.hintTextDirection,
    this.initialValue,
    this.validator,
    this.onSave,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.linesCount = 1,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.textAlign,
    this.autovalidateMode,
    this.onTap,
    this.onSubmit,
    this.readOnly = false,
    this.decoration,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.maxLength,
    this.textAlignVertical,
    this.maxWidth,
    this.textCapitalization,
    this.isRequired = true,
    this.isDense = false,
    this.filled,
    this.fillColor,
    this.focusedBorder,
    this.contentPadding,
    this.prefixIcon,
    this.enabledBorder,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.hintText,
    this.label,
    this.suffixIcon,
    this.hintStyle,
    this.showAsterisk = true,
    this.isEnable = true,
    this.decorationStyleType = DecorationStyleType.outline,
  });

  @override
  Widget build(BuildContext context) {
    // Define color constants for border and error states.
    const border = Colors.grey;
    const error = Colors.red;

    // Return a ConstrainedBox widget to apply maximum width constraints to the TextFormField.
    return ConstrainedBox(
      constraints: BoxConstraints(
        // Sets the maximum width of the TextFormField. Defaults to 370 if `maxWidth` is not provided.
        maxWidth: (maxWidth ?? 370),
      ),
      child: TextFormField(
        // Limits the maximum number of characters that can be entered in the field.
        maxLength: maxLength,
        // Callback triggered when the form field is tapped.
        onTap: onTap,
        // List of input formatters to format the text input.
        inputFormatters: textInputFormatter,
        // Makes the field read-only if set to true. User cannot modify the text.
        readOnly: readOnly,
        // Initial value of the form field when it is created.
        initialValue: initialValue,
        // Controller for managing the text input and its state.
        controller: controller,
        // Style for the text in the field. Falls back to theme's labelMedium style if not provided.
        style: style ?? Theme.of(context).textTheme.labelMedium,
        // Determines when validation should occur (e.g., on every change, on submission).
        autovalidateMode: autovalidateMode,
        // Alignment of the text within the field. Defaults to start if not provided.
        textAlign: textAlign ?? TextAlign.start,
        // Callback triggered when the text in the field changes.
        onChanged: onChanged,
        // Callback triggered when editing is completed (e.g., pressing the "done" button).
        onEditingComplete: onSubmit,
        // Callback for saving the value of the form field.
        onSaved: onSave,
        // Minimum number of lines to show when the field is not expanded.
        minLines: minLines,
        // Maximum number of lines to show when the field is expanded.
        maxLines: linesCount,
        // Validator function to validate the text input. Applied only if `isRequired` is true.
        validator: isRequired ? validator : null,
        // Type of keyboard to display (e.g., text, number) for the field.
        keyboardType: keyboardType,
        // Action button on the keyboard (e.g., "done", "next").
        textInputAction: textInputAction,
        // Node that manages the focus state of the field.
        focusNode: focusNode,
        // If true, obscures the text in the field (useful for password inputs).
        obscureText: obscureText,
        // Character used to obscure text, default is '*'.
        obscuringCharacter: '*',
        // Callback triggered when the user taps outside the field. Closes the keyboard if `shouldCloseKeyboardOnTapOutside` is true.
        onTapOutside: (event) {
          if (shouldCloseKeyboardOnTapOutside) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        // Text capitalization mode for the field.
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        // Vertical alignment of the text within the field.
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        // Decoration to apply to the field. Falls back to a default style if not provided.
        decoration: decoration ??
            getInputDecoration(
              border: border,
              context: context,
              filled: filled,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: contentPadding,
              prefixIconConstraints: prefixIconConstraints,
              suffixIconConstraints: suffixIconConstraints,
              label: label,
              labelColor: labelColor,
              error: error,
              hintText: hintText,
              hintStyle: hintStyle,
              decorationStyleType: decorationStyleType,
              isRequired: isRequired,
              showAsterisk: showAsterisk,
              isDense: isDense,
              isEnable: isEnable,
            ),

        cursorHeight: 18,
      ),
    );
  }
}

enum MainTextField {
  text,
  number,
  phone,
  email,
  userName,
  password,
}
