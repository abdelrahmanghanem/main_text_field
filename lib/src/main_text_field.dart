import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_text_field/src/strings.dart';
import 'package:main_text_field/src/widgets/prefix_icon_widget.dart';
import 'package:smart_localize/smart_localize.dart';

import '../main_text_field.dart';
import 'widgets/header_text_field_widget.dart';

part 'confirm_password_main_text_field.dart';
part 'email_main_text_field.dart';
part 'number_main_text_field.dart';
part 'password_main_text_field.dart';
part 'phone_main_text_field.dart';

/// A custom text form field widget that provides a variety of configurable options
/// including borders, icons, validation, and text input handling.
class MainTextField extends StatefulWidget {
  final bool? filled;
  final Color? fillColor;

  /// control in maxWidth for ipad and default value is 370.
  final double? maxWidth;

  /// The minimum number of lines for the field. Defaults to `1`.
  final int minLines;
  final TextStyle? titleStyle;

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
  final void Function(String? val)? onSaved;

  /// A callback function triggered when the input text changes.
  final void Function(String)? onChanged;

  /// A callback triggered when the submit action occurs on the keyboard.
  final VoidCallback? onEditingComplete;

  /// A callback that triggers when the form field is tapped.
  final void Function()? onTap;

  /// The number of lines to display in the form field. Defaults to `1`.
  final int maxLines;
  final double spaceBetween;

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
  final Iterable<String>? autofillHints;

  /// The action button to show on the keyboard (e.g., "done", "next"). Defaults to `TextInputAction.next`.
  final TextInputAction? textInputAction;

  /// The vertical alignment of the text inside the form field. Defaults to `TextAlignVertical.center`.
  final TextAlignVertical? textAlignVertical;

  /// Determines when the field should validate its value (e.g., on user interaction). Defaults to `AutovalidateMode.disabled`.
  final AutovalidateMode? autoValidateMode;

  /// A list of input formatters to apply (e.g., restricting input to digits).
  final List<TextInputFormatter>? inputFormatters;

  /// Controls how the text input should be capitalized (e.g., sentences, words).
  final TextCapitalization? textCapitalization;

  //   inputDecoration: InputDecoration

  /// A flag that marks the form field as required for validation purposes.
  final bool isRequired;
  final bool hideAsterisk;

  /// Padding around the content of the form field.
  final EdgeInsets? contentPadding;
  final bool showPrefixIcon;

  /// A widget to display as a prefix icon inside the form field.
  final Widget? prefixIcon;

  /// A widget to display as a suffix icon inside the form field.
  final Widget? suffixIcon;

  /// The label text displayed above the form field.
  final String? labelText;

  /// Hint text displayed inside the field when it is empty.
  final String? hintText;

  /// A flag to control whether the form field is rendered densely.
  final bool isDense;

  /// A flag that enables or disables the form field. Defaults to `true` (enabled).
  final bool isEnable;

  final String? title;

  /// A flag to show an asterisk (*) next to the label for required fields. Defaults to `true`.
  final bool showAsterisk;

  final double? cursorHeight;
  final bool? obscureText;
  final String? obscuringCharacter;
  final TextDirection? textDirection;

  const MainTextField({
    this.filled,
    this.fillColor,
    super.key,
    this.maxWidth,
    this.autofillHints,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.spaceBetween = 4,
    this.readOnly = false,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.showAsterisk = false,
    this.isEnable = true,
    this.cursorHeight = 18.0,
    this.inputFormatters,
    this.hintTextDirection,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.textAlign,
    this.autoValidateMode,
    this.onTap,
    this.onEditingComplete,
    this.decoration,
    this.style,
    this.maxLength,
    this.textAlignVertical,
    this.textCapitalization,
    this.isRequired = true,
    this.hideAsterisk = false,
    this.isDense = false,
    this.contentPadding,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.title,
    this.obscureText,
    this.obscuringCharacter,
    this.textDirection,
    this.titleStyle,
    this.showPrefixIcon = false,
  });

  factory MainTextField.email({
    double? maxWidth,
    double spaceBetween = 4,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    double? cursorHeight,
    EdgeInsets? contentPadding,
    TextAlign? textAlign,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    Widget? prefixIcon,
    bool showPrefixIcon = false,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    String? title,
    bool hideTitle = false,
    bool? filled,
    Color? fillColor,
    TextStyle? titleStyle,
    TextDirection? textDirection,
  }) {
    return _EmailMainTextField(
      showAsterisk: false,
      maxWidth: maxWidth,
      spaceBetween: spaceBetween,
      title: title,
      hideTitle: hideTitle,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      showPrefixIcon: showPrefixIcon,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      controller: controller,
      style: style,
      autoValidateMode: autoValidateMode,
      isRequired: isRequired,
      hideAsterisk: hideAsterisk,
      textInputAction: textInputAction,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      titleStyle: titleStyle,
      // inputDecoration
      decoration: decoration,

      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,

      labelText: labelText,
      hintText: hintText,
      isDense: isDense,
      isEnable: isEnable,

      cursorHeight: cursorHeight,
      textDirection: textDirection,
      filled: filled,
      fillColor: fillColor,
    );
  }

  factory MainTextField.password({
    double? maxWidth,
    double spaceBetween = 4,
    bool showPrefixIcon = false,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    double? cursorHeight,
    EdgeInsets? contentPadding,
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,

    /// The border when the field is focused.
    InputBorder? focusedBorder,
    Widget? prefixIcon,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
  }) {
    return _PasswordMainTextField(
      maxWidth: maxWidth,
      title: title,
      showPrefixIcon: showPrefixIcon,
      titleStyle: titleStyle,
      spaceBetween: spaceBetween,
      initialValue: initialValue,
      readOnly: readOnly,
      isEnable: isEnable,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      controller: controller,
      style: style,
      autoValidateMode: autoValidateMode,
      isRequired: isRequired,
      hideAsterisk: hideAsterisk,
      textInputAction: textInputAction,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      // inputDecoration
      decoration: decoration,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,

      labelText: labelText,

      hintText: hintText,
      isDense: isDense,
      cursorHeight: cursorHeight,
    );
  }

  factory MainTextField.confirmPassword({
    TextStyle? titleStyle,
    bool showPrefixIcon = false,
    double maxWidth = 370,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    double spaceBetween = 4,
    double? cursorHeight,
    EdgeInsets? contentPadding,
    required String? passwordValue,
    TextAlign? textAlign,
    String? title,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
  }) {
    return _ConfirmPasswordMainTextField(
      maxWidth: maxWidth,
      title: title,
      showPrefixIcon: showPrefixIcon,
      spaceBetween: spaceBetween,
      passwordValue: passwordValue,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      controller: controller,
      style: style,
      autoValidateMode: autoValidateMode,
      isRequired: isRequired,
      hideAsterisk: hideAsterisk,
      textInputAction: textInputAction,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      // inputDecoration
      decoration: decoration,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      labelText: labelText,
      hintText: hintText,
      isDense: isDense,
      isEnable: isEnable,
      cursorHeight: cursorHeight,
      titleStyle: titleStyle,
    );
  }

  factory MainTextField.number({
    double maxWidth = 370,
    bool readOnly = false,
    double spaceBetween = 4,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    double? cursorHeight,
    EdgeInsets? contentPadding,
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSaved,
    void Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
  }) {
    return _NumberMainTextField(
      maxWidth: maxWidth,
      title: title,
      spaceBetween: spaceBetween,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      validator: validator,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      controller: controller,
      style: style,
      autoValidateMode: autoValidateMode,
      isRequired: isRequired,
      hideAsterisk: hideAsterisk,
      textInputAction: textInputAction,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      decoration: decoration,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      labelText: labelText,
      hintText: hintText,
      isDense: isDense,
      isEnable: isEnable,
      cursorHeight: cursorHeight,
      titleStyle: titleStyle,
    );
  }

  factory MainTextField.phone({
    double maxWidth = 370,
    double spaceBetween = 4,
    bool showPrefixIcon = false,
    String initialCountryCode = '+20',
    List<String> favoriteCountryCode = const ['+20', '+966'],
    double? cursorHeight,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    EdgeInsets? contentPadding,
    void Function(CountryCode)? onChangedCountryCode,
    TextAlign? textAlign,
    String? title,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSaved,
    void Function(String)? onChanged,
    VoidCallback? onEditingComplete,
    void Function()? onTap,
    TextStyle? style,
    TextStyle? titleStyle,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return _PhoneMainTextField(
      countryCode: initialCountryCode,
      onChangedCountryCode: onChangedCountryCode,
      favoriteCountryCode: favoriteCountryCode,
      maxWidth: maxWidth,
      title: title,
      showPrefixIcon: showPrefixIcon,
      titleStyle: titleStyle,
      spaceBetween: spaceBetween,
      initialValue: initialValue,
      onTap: onTap,
      textDirection: textDirection,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      validator: validator,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      controller: controller,
      style: style,
      autoValidateMode: autoValidateMode,
      isRequired: isRequired,
      hideAsterisk: hideAsterisk,
      textInputAction: textInputAction,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      // inputDecoration
      decoration: decoration,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      labelText: labelText,
      hintText: hintText,

      isDense: isDense,
      isEnable: isEnable,
      cursorHeight: cursorHeight,
    );
  }

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth ?? 370),
      child: Column(
        children: [
          if (widget.title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: HeaderFieldWidget(
                    title: '${widget.title}',
                    isRequired: widget.isRequired,
                    hideAsterisk: widget.hideAsterisk,
                    titleStyle: widget.titleStyle,
                  ),
                ),
                // button ?? const SizedBox.shrink()
              ],
            ),
          SizedBox(height: widget.spaceBetween),
          Directionality(
            textDirection: widget.textDirection ?? Directionality.of(context),
            child: TextFormField(
              autofillHints: widget.autofillHints,
              // Limits the maximum number of characters that can be entered in the field.
              maxLength: widget.maxLength,
              // Callback triggered when the form field is tapped.
              onTap: widget.onTap,
              // List of input formatters to format the text input.
              inputFormatters: widget.inputFormatters,
              // Makes the field read-only if set to true. User cannot modify the text.
              readOnly: widget.readOnly,
              // Initial value of the form field when it is created.
              initialValue: widget.initialValue,
              // Controller for managing the text input and its state.
              controller: widget.controller,

              // Style for the text in the field. Falls back to theme's labelMedium style if not provided.
              style: widget.style ?? Theme.of(context).textTheme.labelMedium,
              // Determines when validation should occur (e.g., on every change, on submission).
              autovalidateMode: widget.autoValidateMode,
              // Alignment of the text within the field. Defaults to start if not provided.
              textAlign: widget.textAlign ?? TextAlign.start,
              // Callback triggered when the text in the field changes.
              onChanged: widget.onChanged,
              // Callback triggered when editing is completed (e.g., pressing the "done" button).
              onEditingComplete: widget.onEditingComplete,
              // Callback for saving the value of the form field.
              onSaved: widget.onSaved,
              // Minimum number of lines to show when the field is not expanded.
              minLines: widget.minLines,
              // Maximum number of lines to show when the field is expanded.
              maxLines: widget.maxLines,
              // Validator function to validate the text input. Applied only if `isRequired` is true.
              validator: widget.isRequired ? widget.validator : null,

              // Type of keyboard to display (e.g., text, number) for the field.
              keyboardType: widget.keyboardType,
              // Action button on the keyboard (e.g., "done", "next").
              textInputAction: widget.textInputAction,
              // Node that manages the focus state of the field.
              focusNode: widget.focusNode,

              obscureText: widget.obscureText ?? false,
              // Character used to obscure text, default is '*'.
              obscuringCharacter: widget.obscuringCharacter ?? '*',
              // Callback triggered when the user taps outside the field. Closes the keyboard if `shouldCloseKeyboardOnTapOutside` is true.
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },

              // Text capitalization mode for the field.
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              // Vertical alignment of the text within the field.
              textAlignVertical:
                  widget.textAlignVertical ?? TextAlignVertical.center,
              // Decoration to apply to the field. Falls back to a default style if not provided.
              decoration: widget.decoration ??
                  getInputDecoration(
                    context: context,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    contentPadding: widget.contentPadding ??
                        const EdgeInsets.symmetric(horizontal: 8),
                    labelText: widget.labelText,
                    hintText: widget.hintText,
                    isRequired: widget.isRequired,
                    showAsterisk: widget.showAsterisk,
                    isDense: widget.isDense,
                    isEnable: widget.isEnable,
                  ),

              cursorHeight: widget.cursorHeight,
            ),
          ),
        ],
      ),
    );
  }
}
