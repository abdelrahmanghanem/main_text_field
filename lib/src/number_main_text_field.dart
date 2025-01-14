part of 'main_text_field.dart';

// class _NumberMainTextField extends MainTextField {
//   const _NumberMainTextField({
//     required super.maxWidth,
//     required super.title,
//     required super.titleStyle,
//     required super.spaceBetween,
//     required super.onTap,
//     required super.hideHintText,
//     required super.inputFormatters,
//     required super.readOnly,
//     required super.initialValue,
//     required super.controller,
//     required super.style,
//     required super.autoValidateMode,
//     required super.textAlign,
//     required super.onChanged,
//     required super.onEditingComplete,
//     required super.onSaved,
//     required super.isRequired,
//     required super.validator,
//     required super.textInputAction,
//     required super.focusNode,
//     required super.textCapitalization,
//     required super.textAlignVertical,
//     required super.decoration,
//     required super.decorationType,
//     required super.borderColor,
//     required super.filled,
//     required super.fillColor,
//     required super.prefixIcon,
//     required super.suffixIcon,
//     required super.contentPadding,
//     required super.prefixIconConstraints,
//     required super.suffixIconConstraints,
//     required super.labelText,
//     required super.labelColor,
//     required super.errorColor,
//     required super.hintText,
//     required super.hintStyle,
//     required super.isDense,
//     required super.isEnable,
//     required super.hideAsterisk,
//     super.radius,
//     required super.showPrefixIcon,
//     required super.cursorHeight,
//   });
//
//   @override
//   State<_NumberMainTextField> createState() => _NumberMainTextFieldState();
// }
//
// class _NumberMainTextFieldState extends State<_NumberMainTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(maxWidth: widget.maxWidth),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: HeaderFieldWidget(
//                   title: widget.title ?? SmartLocalize.number,
//                   isRequired: widget.isRequired,
//                   hideAsterisk: widget.hideAsterisk,
//                   titleStyle: widget.titleStyle,
//                 ),
//               ),
//               // button ?? const SizedBox.shrink()
//             ],
//           ),
//           SizedBox(height: widget.spaceBetween),
//           TextFormField(
//             // Callback triggered when the form field is tapped.
//             onTap: widget.onTap,
//             // Makes the field read-only if set to true. User cannot modify the text.
//             readOnly: widget.readOnly,
//             // Initial value of the form field when it is created.
//             initialValue: widget.initialValue,
//             // Controller for managing the text input and its state.
//             controller: widget.controller,
//             // Style for the text in the field. Falls back to theme's labelMedium style if not provided.
//             style: widget.style ?? Theme.of(context).textTheme.labelMedium,
//             // Determines when validation should occur (e.g., on every change, on submission).
//             autovalidateMode: widget.autoValidateMode,
//             // Alignment of the text within the field. Defaults to start if not provided.
//             textAlign: widget.textAlign ?? TextAlign.start,
//             // Callback triggered when the text in the field changes.
//             onChanged: widget.onChanged,
//             // Callback triggered when editing is completed (e.g., pressing the "done" button).
//             onEditingComplete: widget.onEditingComplete,
//             // Callback for saving the value of the form field.
//             onSaved: widget.onSaved,
//
//             // Validator function to validate the text input. Applied only if `isRequired` is true.
//             validator: widget.validator ?? (val) => validateNumberFormat(val),
//             // List of input formatters to format the text input.
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly,
//               ...?widget.inputFormatters,
//             ],
//             // Type of keyboard to display (e.g., text, number) for the field.
//             keyboardType: TextInputType.number,
//
//             // Action button on the keyboard (e.g., "done", "next").
//             textInputAction: widget.textInputAction,
//             // Node that manages the focus state of the field.
//             focusNode: widget.focusNode,
//
//             // Callback triggered when the user taps outside the field. Closes the keyboard if `shouldCloseKeyboardOnTapOutside` is true.
//             onTapOutside: (event) {
//               FocusManager.instance.primaryFocus?.unfocus();
//             },
//             // Text capitalization mode for the field.
//             textCapitalization:
//                 widget.textCapitalization ?? TextCapitalization.none,
//             // Vertical alignment of the text within the field.
//             textAlignVertical:
//                 widget.textAlignVertical ?? TextAlignVertical.center,
//             // Decoration to apply to the field. Falls back to a default style if not provided.
//             decoration: widget.decoration ??
//                 getInputDecoration(
//                   border: widget.borderColor ?? Colors.grey,
//                   context: context,
//                   filled: widget.filled,
//                   fillColor: widget.fillColor,
//                   prefixIcon: widget.prefixIcon ??
//                       (widget.showPrefixIcon
//                           ? const Padding(
//                               padding: EdgeInsets.all(10),
//                               child: PrefixIconWidget(
//                                 assetPath: AppImages.calculator,
//                               ),
//                             )
//                           : null),
//                   suffixIcon: widget.suffixIcon,
//                   contentPadding: widget.contentPadding ??
//                       const EdgeInsets.symmetric(horizontal: 8),
//                   prefixIconConstraints: widget.prefixIconConstraints,
//                   suffixIconConstraints: widget.suffixIconConstraints,
//                   labelText: widget.labelText,
//                   labelColor: widget.labelColor,
//                   error:
//                       widget.errorColor ?? Theme.of(context).colorScheme.error,
//                   hintStyle: widget.hintStyle,
//                   hintText: widget.hideHintText
//                       ? null
//                       : widget.hintText ??
//                           SmartLocalizePlaceholder.pleaseEnterNumber,
//                   decorationType: widget.decorationType,
//                   isRequired: widget.isRequired,
//                   showAsterisk: widget.showAsterisk,
//                   isDense: widget.isDense,
//                   isEnable: widget.isEnable,
//                   radius: widget.radius,
//                 ),
//
//             cursorHeight: widget.cursorHeight ?? 18.0,
//           ),
//         ],
//       ),
//     );
//   }
// }

class _NumberMainTextField extends MainTextField {
  const _NumberMainTextField({
    required super.maxWidth,
    required super.title,
    required super.titleStyle,
    required super.spaceBetween,
    required super.onTap,
    required super.hideHintText,
    required super.inputFormatters,
    required super.readOnly,
    required super.initialValue,
    required super.controller,
    required super.style,
    required super.autoValidateMode,
    required super.textAlign,
    required super.onChanged,
    required super.onEditingComplete,
    required super.onSaved,
    required super.isRequired,
    required super.validator,
    required super.textInputAction,
    required super.focusNode,
    required super.textCapitalization,
    required super.textAlignVertical,
    required super.decoration,
    required super.decorationType,
    required super.borderColor,
    required super.filled,
    required super.fillColor,
    required super.prefixIcon,
    required super.suffixIcon,
    required super.contentPadding,
    required super.prefixIconConstraints,
    required super.suffixIconConstraints,
    required super.labelText,
    required super.labelColor,
    required super.errorColor,
    required super.hintText,
    required super.hintStyle,
    required super.isDense,
    required super.isEnable,
    required super.hideAsterisk,
    super.radius,
    required super.showPrefixIcon,
    required super.cursorHeight,
  });

  @override
  State<_NumberMainTextField> createState() => _NumberMainTextFieldState();
}

class _NumberMainTextFieldState extends State<_NumberMainTextField> {
  @override
  Widget build(BuildContext context) {
    return MainTextField(
      maxWidth: widget.maxWidth,
      title: widget.title ?? SmartLocalize.number,
      titleStyle: widget.titleStyle,
      spaceBetween: widget.spaceBetween,
      onTap: widget.onTap,
      hideHintText: widget.hideHintText,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      controller: widget.controller,
      style: widget.style,
      autoValidateMode: widget.autoValidateMode,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSaved: widget.onSaved,
      isRequired: widget.isRequired,
      validator: widget.validator ?? (val) => validateNumberFormat(val),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ...?widget.inputFormatters,
      ],
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,
      textAlignVertical: widget.textAlignVertical,
      decoration: widget.decoration,
      decorationType: widget.decorationType,
      borderColor: widget.borderColor,
      filled: widget.filled,
      fillColor: widget.fillColor,
      prefixIcon: widget.prefixIcon ??
          (widget.showPrefixIcon
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: PrefixIconWidget(
                    assetPath: AppImages.calculator,
                  ),
                )
              : null),
      suffixIcon: widget.suffixIcon,
      contentPadding: widget.contentPadding,
      prefixIconConstraints: widget.prefixIconConstraints,
      suffixIconConstraints: widget.suffixIconConstraints,
      labelText: widget.labelText,
      labelColor: widget.labelColor,
      errorColor: widget.errorColor,
      hintStyle: widget.hintStyle,
      hintText: widget.hideHintText
          ? null
          : widget.hintText ?? SmartLocalizePlaceholder.pleaseEnterNumber,
      isDense: widget.isDense,
      isEnable: widget.isEnable,
      hideAsterisk: widget.hideAsterisk,
      radius: widget.radius,
      showPrefixIcon: widget.showPrefixIcon,
      cursorHeight: widget.cursorHeight,
    );
  }
}
