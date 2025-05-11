part of 'main_text_field.dart';

class _ConfirmPasswordMainTextField extends MainTextField {
  final String? passwordValue;

  const _ConfirmPasswordMainTextField({
    required this.passwordValue,
    required super.maxWidth,
    required super.title,
    required super.onTap,
    required super.spaceBetween,
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
    required super.filled,
    required super.fillColor,
    required super.prefixIcon,
    required super.suffixIcon,
    required super.contentPadding,
    required super.labelText,
    required super.hintText,
    required super.isDense,
    required super.isEnable,
    required super.hideAsterisk,
    required super.showPrefixIcon,
    required super.cursorHeight,
    required super.titleStyle,
  });

  @override
  State<_ConfirmPasswordMainTextField> createState() =>
      _ConfirmPasswordMainTextFieldState();
}

class _ConfirmPasswordMainTextFieldState
    extends State<_ConfirmPasswordMainTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTextField(
          maxWidth: widget.maxWidth,
          title: widget.title ?? SmartLocalize.confirmPassword,
          onTap: widget.onTap,
          spaceBetween: widget.spaceBetween,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ...?widget.inputFormatters,
          ],
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
          validator: widget.validator ??
              (val) => validateConfirmPasswordFormat(
                    password: val,
                    confirmPassword: widget.passwordValue,
                  ),
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          textCapitalization: widget.textCapitalization,
          textAlignVertical: widget.textAlignVertical,
          decoration: widget.decoration,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: widget.prefixIcon ??
              (widget.showPrefixIcon
                  ? const Padding(
                      padding: EdgeInsets.all(10),
                      child: PrefixIconWidget(
                        assetPath: AppImages.lock,
                      ),
                    )
                  : null),
          suffixIcon: widget.suffixIcon ??
              IconButton(
                onPressed: () => setState(() {
                  showPassword = !showPassword;
                }),
                icon: PrefixIconWidget(
                  assetPath: showPassword ? AppImages.eyeSlash : AppImages.eye,
                ),
              ),
          hintText:
              widget.hintText ?? SmartLocalizePlaceholder.pleaseConfirmPassword,
          isDense: widget.isDense,
          isEnable: widget.isEnable,
          cursorHeight: widget.cursorHeight ?? 18.0,
          hideAsterisk: widget.hideAsterisk,
          labelText: widget.labelText,
          filled: widget.filled,
          fillColor: widget.fillColor,
          contentPadding: widget.contentPadding,
          obscureText: !showPassword,
          obscuringCharacter: '*',
          titleStyle: widget.titleStyle,
        ),
      ],
    );
  }
}
