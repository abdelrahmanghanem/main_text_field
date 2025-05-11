part of 'main_text_field.dart';

class _EmailMainTextField extends MainTextField {
  final bool hideTitle;

  const _EmailMainTextField({
    required this.hideTitle,
    required super.maxWidth,
    required super.title,
    required super.spaceBetween,
    required super.onTap,
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

    // input Decoration
    required super.decoration,
    required super.prefixIcon,
    required super.suffixIcon,
    required super.contentPadding,
    required super.labelText,
    required super.hintText,
    required super.showAsterisk,
    required super.isDense,
    required super.isEnable,
    required super.hideAsterisk,
    required super.cursorHeight,
    required super.textDirection,
    required super.filled,
    required super.fillColor,
    required super.titleStyle,
    required super.showPrefixIcon,
  });

  @override
  State<_EmailMainTextField> createState() => _EmailMainTextFieldState();
}

class _EmailMainTextFieldState extends State<_EmailMainTextField> {
  @override
  Widget build(BuildContext context) {
    return MainTextField(
      autofillHints: [AutofillHints.username],
      keyboardType: TextInputType.emailAddress,
      maxWidth: widget.maxWidth,
      title: widget.title ?? SmartLocalize.email,
      spaceBetween: widget.spaceBetween,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
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
      validator: widget.validator ?? (val) => validateEmailFormat(val),
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,
      textAlignVertical: widget.textAlignVertical,
      decoration: widget.decoration,
      prefixIcon: widget.prefixIcon ??
          (widget.showPrefixIcon
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: PrefixIconWidget(
                    assetPath: AppImages.sms,
                  ),
                )
              : null),
      suffixIcon: widget.suffixIcon,
      contentPadding: widget.contentPadding,
      labelText: widget.labelText,
      hintText: widget.hintText ?? SmartLocalizePlaceholder.enterEmail,
      showAsterisk: widget.showAsterisk,
      isDense: widget.isDense,
      isEnable: widget.isEnable,
      filled: widget.filled,
      fillColor: widget.fillColor,
      hideAsterisk: widget.hideAsterisk,
      cursorHeight: widget.cursorHeight,
      titleStyle: widget.titleStyle,
    );
  }
}
