part of 'main_text_field.dart';

class _ConfirmPasswordMainTextField extends MainTextField {
  final String? passwordValue;
  const _ConfirmPasswordMainTextField({
    required this.passwordValue,
    required super.width,
    required super.title,
    required super.onTap,
    required super.titleStyle,
    required super.hideHintText,
    required super.textInputFormatter,
    required super.readOnly,
    required super.initialValue,
    required super.controller,
    required super.style,
    required super.autoValidateMode,
    required super.textAlign,
    required super.onChanged,
    required super.onSubmit,
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
    super.radius,
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        // Sets the maximum width of the TextFormField. Defaults to 370 if `maxWidth` is not provided.
        maxWidth: widget.width,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: HeaderFieldWidget(
                  title: widget.title ?? SmartLocalize.confirmPassword,
                  isRequired: widget.isRequired,
                  titleStyle: widget.titleStyle,
                ),
              ),
              // button ?? const SizedBox.shrink()
            ],
          ),
          TextFormField(
            // Callback triggered when the form field is tapped.
            onTap: widget.onTap,

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

            // Validator function to validate the text input. Applied only if `isRequired` is true.
            validator: widget.validator ??
                (val) => validateConfirmPasswordFormat(
                      password: val,
                      confirmPassword: widget.passwordValue,
                    ),
            // List of input formatters to format the text input.
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ...?widget.textInputFormatter,
            ],
            // Type of keyboard to display (e.g., text, number) for the field.
            keyboardType: TextInputType.visiblePassword,
            // If true, obscures the text in the field (useful for password inputs).
            obscureText: !showPassword,
            // Character used to obscure text, default is '*'.
            obscuringCharacter: '*',
            // Action button on the keyboard (e.g., "done", "next").
            textInputAction: widget.textInputAction,
            // Node that manages the focus state of the field.
            focusNode: widget.focusNode,

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
                  prefixIcon: widget.prefixIcon ??
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: PrefixIconWidget(assetPath: AppImages.lock),
                      ),
                  suffixIcon: widget.suffixIcon ??
                      IconButton(
                        onPressed: () => setState(() {
                          showPassword = !showPassword;
                        }),
                        icon: PrefixIconWidget(
                          assetPath:
                              showPassword ? AppImages.eyeSlash : AppImages.eye,
                        ),
                      ),
                  contentPadding: widget.contentPadding,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffixIconConstraints: widget.suffixIconConstraints,
                  labelText: widget.labelText,
                  labelColor: widget.labelColor,
                  error:
                      widget.errorColor ?? Theme.of(context).colorScheme.error,
                  hintText: widget.hideHintText
                      ? null
                      : widget.hintText ??
                          SmartLocalizePlaceholder.pleaseConfirmPassword,
                  hintStyle: widget.hintStyle,
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
