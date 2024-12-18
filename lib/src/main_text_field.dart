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
  /// The width of the form field. If `null`, it takes up the available space.
  final double width;

  /// control in maxWidth for ipad and default value is 370.
  final double maxWidth;

  /// The radius of the corners of the field. Defaults to `12`.
  final double radius;

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
  final void Function(String? val)? onSaved;

  /// A callback function triggered when the input text changes.
  final void Function(String)? onChanged;

  /// A callback triggered when the submit action occurs on the keyboard.
  final VoidCallback? onSubmit;

  /// A callback that triggers when the form field is tapped.
  final void Function()? onTap;

  /// The number of lines to display in the form field. Defaults to `1`.
  final int maxLines;
  final double titlePadding;

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
  final AutovalidateMode? autoValidateMode;

  /// A list of input formatters to apply (e.g., restricting input to digits).
  final List<TextInputFormatter>? textInputFormatter;

  /// Controls how the text input should be capitalized (e.g., sentences, words).
  final TextCapitalization? textCapitalization;

  //   inputDecoration: InputDecoration

  /// A flag that marks the form field as required for validation purposes.
  final bool isRequired;
  final bool hideAsterisk;

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
  final bool showPrefixIcon;

  /// Constraints for the prefix icon (e.g., size).
  final BoxConstraints? prefixIconConstraints;

  /// Constraints for the prefix icon (e.g., size).
  final BoxConstraints? suffixIconConstraints;

  /// The border when the field is enabled.
  final InputBorder? enabledBorder;

  /// A widget to display as a suffix icon inside the form field.
  final Widget? suffixIcon;

  /// The label text displayed above the form field.
  final String? labelText;

  /// Hint text displayed inside the field when it is empty.
  final String? hintText;
  final bool hideHintText;

  /// A flag to control whether the form field is rendered densely.
  final bool isDense;

  /// The style for the hint text inside the field.
  final TextStyle? hintStyle;

  /// A flag that enables or disables the form field. Defaults to `true` (enabled).
  final bool isEnable;

  /// A flag that enables or disables the form field. Defaults to `true` (enabled).
  final Color? errorColor;
  final Color? borderColor;
  final String? title;
  final TextStyle? titleStyle;

  /// A flag to show an asterisk (*) next to the label for required fields. Defaults to `true`.
  final bool showAsterisk;

  final DecorationType decorationType;

  const MainTextField({
    super.key,
    this.width = double.infinity,
    this.maxWidth = 370,
    this.radius = 12,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.titlePadding = 4,
    this.readOnly = false,
    this.showPrefixIcon = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.textInputAction = TextInputAction.next,
    this.showAsterisk = false,
    this.isEnable = true,
    this.decorationType = DecorationType.outline,
    this.textInputFormatter,
    this.labelColor,
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
    this.onSubmit,
    this.decoration,
    this.style,
    this.maxLength,
    this.textAlignVertical,
    this.textCapitalization,
    this.isRequired = true,
    this.hideAsterisk = false,
    this.isDense = false,
    this.filled,
    this.fillColor,
    this.focusedBorder,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.enabledBorder,
    this.suffixIconConstraints,
    this.hintText,
    this.hideHintText = false,
    this.labelText,
    this.suffixIcon,
    this.hintStyle,
    this.errorColor,
    this.borderColor,
    this.title,
    this.titleStyle,
  });

  factory MainTextField.email({
    double width = double.infinity,

    /// control in maxWidth for ipad and default value is 370.
    double maxWidth = 370,
    double radius = 12,
    double titlePadding = 4,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    bool hideHintText = false,
    DecorationType decorationType = DecorationType.outline,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    TextAlign? textAlign,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onSubmit,
    void Function()? onTap,
    Color? labelColor,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? textInputFormatter,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,
    InputBorder? focusedBorder,
    bool showPrefixIcon = false,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    String? title,
    bool hideTitle = false,
    TextStyle? titleStyle,
    TextStyle? hintStyle,
    Color? errorColor,
    Color? borderColor,
  }) {
    return _EmailMainTextField(
      showAsterisk: false,
      width: width,
      maxWidth: maxWidth,
      titlePadding: titlePadding,
      title: title,
      showPrefixIcon: showPrefixIcon,
      hideTitle: hideTitle,
      titleStyle: titleStyle,
      hideHintText: hideHintText,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      textInputFormatter: textInputFormatter,
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
      decorationType: decorationType,
      borderColor: borderColor,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      labelText: labelText,
      labelColor: labelColor,
      errorColor: errorColor,
      hintText: hintText,
      hintStyle: hintStyle,
      isDense: isDense,
      isEnable: isEnable,
    );
  }

  factory MainTextField.password({
    /// The width of the form field. If `null`, it takes up the available space.
    double width = double.infinity,

    /// control in maxWidth for ipad and default value is 370.
    double maxWidth = 370,
    double radius = 12,
    double titlePadding = 4,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    bool hideHintText = false,
    bool showPrefixIcon = false,
    DecorationType decorationType = DecorationType.outline,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onSubmit,
    void Function()? onTap,
    Color? labelColor,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? textInputFormatter,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,

    /// The border when the field is focused.
    InputBorder? focusedBorder,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    TextStyle? hintStyle,
    Color? errorColor,
    Color? borderColor,
  }) {
    return _PasswordMainTextField(
      width: width,
      maxWidth: maxWidth,
      title: title,
      titleStyle: titleStyle,
      titlePadding: titlePadding,
      hideHintText: hideHintText,
      initialValue: initialValue,
      readOnly: readOnly,
      isEnable: isEnable,
      showPrefixIcon: showPrefixIcon,
      onTap: onTap,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      textInputFormatter: textInputFormatter,
      radius: radius,
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
      decorationType: decorationType,
      borderColor: borderColor,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      labelText: labelText,
      labelColor: labelColor,
      errorColor: errorColor,
      hintText: hintText,
      hintStyle: hintStyle,
      isDense: isDense,
    );
  }

  factory MainTextField.confirmPassword({
    /// The width of the form field. If `null`, it takes up the available space.
    double width = double.infinity,

    /// control in maxWidth for ipad and default value is 370.
    double maxWidth = 370,
    double radius = 12,
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    bool hideHintText = false,
    double titlePadding = 4,
    bool showPrefixIcon = false,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    DecorationType decorationType = DecorationType.outline,
    required String? passwordValue,
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSave,
    void Function(String)? onChanged,
    VoidCallback? onSubmit,
    void Function()? onTap,
    Color? labelColor,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? textInputFormatter,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,

    /// The border when the field is focused.
    InputBorder? focusedBorder,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    TextStyle? hintStyle,
    Color? errorColor,
    Color? borderColor,
  }) {
    return _ConfirmPasswordMainTextField(
      width: width,
      maxWidth: maxWidth,
      title: title,
      showPrefixIcon: showPrefixIcon,
      titlePadding: titlePadding,
      titleStyle: titleStyle,
      hideHintText: hideHintText,
      passwordValue: passwordValue,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onSaved: onSave,
      validator: validator,
      textAlign: textAlign,
      textInputFormatter: textInputFormatter,
      readOnly: readOnly,
      radius: radius,
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
      decorationType: decorationType,
      borderColor: borderColor,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      labelText: labelText,
      labelColor: labelColor,
      errorColor: errorColor,
      hintText: hintText,
      hintStyle: hintStyle,
      isDense: isDense,
      isEnable: isEnable,
    );
  }

  factory MainTextField.number({
    double width = double.infinity,

    /// control in maxWidth for ipad and default value is 370.
    double maxWidth = 370,
    double radius = 12,
    bool readOnly = false,
    double titlePadding = 4,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    bool hideHintText = false,
    bool showPrefixIcon = false,
    EdgeInsets? contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSaved,
    void Function(String)? onChanged,
    VoidCallback? onSubmit,
    void Function()? onTap,
    Color? labelColor,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? textInputFormatter,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,

    /// The border when the field is focused.
    InputBorder? focusedBorder,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    TextStyle? hintStyle,
    Color? errorColor,
    Color? borderColor,
    DecorationType decorationType = DecorationType.outline,
  }) {
    return _NumberMainTextField(
      width: width,
      maxWidth: maxWidth,
      title: title,
      showPrefixIcon: showPrefixIcon,
      titleStyle: titleStyle,
      titlePadding: titlePadding,
      initialValue: initialValue,
      onTap: onTap,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onSaved: onSaved,
      validator: validator,
      textAlign: textAlign,
      textInputFormatter: textInputFormatter,
      readOnly: readOnly,
      radius: radius,
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
      decorationType: decorationType,
      borderColor: borderColor,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      labelText: labelText,
      labelColor: labelColor,
      errorColor: errorColor,
      hintText: hintText,
      hideHintText: hideHintText,
      hintStyle: hintStyle,
      isDense: isDense,
      isEnable: isEnable,
    );
  }

  factory MainTextField.phone({
    double width = double.infinity,

    /// control in maxWidth for ipad and default value is 370.
    double maxWidth = 370,
    double radius = 12,
    double titlePadding = 4,
    String initialCountryCode = '+20',
    List<String> favoriteCountryCode = const ['+20', '+966'],
    bool readOnly = false,
    bool isRequired = true,
    bool hideAsterisk = false,
    bool isDense = false,
    bool isEnable = true,
    bool hideHintText = false,
    bool showPrefixIcon = false,
    EdgeInsets? contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    void Function(CountryCode)? onChangedCountryCode,
    TextAlign? textAlign,
    String? title,
    TextStyle? titleStyle,
    TextDirection? hintTextDirection,
    String? initialValue,
    String? Function(String? val)? validator,
    void Function(String? val)? onSaved,
    void Function(String)? onChanged,
    VoidCallback? onSubmit,
    void Function()? onTap,
    Color? labelColor,
    TextStyle? style,
    FocusNode? focusNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    TextInputAction? textInputAction,
    TextAlignVertical? textAlignVertical,
    AutovalidateMode? autoValidateMode,
    List<TextInputFormatter>? textInputFormatter,
    TextCapitalization? textCapitalization,
    bool? filled,
    Color? fillColor,

    /// The border when the field is focused.
    InputBorder? focusedBorder,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    InputBorder? enabledBorder,
    Widget? suffixIcon,
    String? labelText,
    String? hintText,
    TextStyle? hintStyle,
    Color? errorColor,
    Color? borderColor,
    DecorationType decorationType = DecorationType.outline,
  }) {
    return _PhoneMainTextField(
      countryCode: initialCountryCode,
      onChangedCountryCode: onChangedCountryCode,
      favoriteCountryCode: favoriteCountryCode,
      width: width,
      maxWidth: maxWidth,
      title: title,
      titleStyle: titleStyle,
      titlePadding: titlePadding,
      initialValue: initialValue,
      onTap: onTap,
      showPrefixIcon: showPrefixIcon,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onSaved: onSaved,
      validator: validator,
      textAlign: textAlign,
      textInputFormatter: textInputFormatter,
      readOnly: readOnly,
      radius: radius,
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
      decorationType: decorationType,
      borderColor: borderColor,
      filled: filled,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      labelText: labelText,
      labelColor: labelColor,
      errorColor: errorColor,
      hintText: hintText,
      hideHintText: hideHintText,
      hintStyle: hintStyle,
      isDense: isDense,
      isEnable: isEnable,
    );
  }

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    // Return a ConstrainedBox widget to apply maximum width constraints to the TextFormField.
    return ConstrainedBox(
      constraints: BoxConstraints(
        // Sets the maximum width of the TextFormField. Defaults to 370 if `maxWidth` is not provided.
        maxWidth: MainWidgetsUtil.isTablet ? widget.maxWidth : widget.width,
      ),
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
          SizedBox(height: widget.titlePadding),
          TextFormField(
            // Limits the maximum number of characters that can be entered in the field.
            maxLength: widget.maxLength,
            // Callback triggered when the form field is tapped.
            onTap: widget.onTap,
            // List of input formatters to format the text input.
            inputFormatters: widget.textInputFormatter,
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
            onEditingComplete: widget.onSubmit,
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

            // Character used to obscure text, default is '*'.
            obscuringCharacter: '*',
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
                  border: widget.borderColor ?? Colors.grey,
                  context: context,
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  contentPadding: widget.contentPadding,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffixIconConstraints: widget.suffixIconConstraints,
                  labelText: widget.labelText,
                  labelColor: widget.labelColor,
                  error:
                      widget.errorColor ?? Theme.of(context).colorScheme.error,
                  hintText: widget.hintText,
                  hintStyle: widget.hideHintText ? null : widget.hintStyle,
                  decorationType: widget.decorationType,
                  isRequired: widget.isRequired,
                  showAsterisk: widget.showAsterisk,
                  isDense: widget.isDense,
                  isEnable: widget.isEnable,
                  radius: widget.radius,
                ),

            cursorHeight: 18,
          ),
        ],
      ),
    );
  }
}
