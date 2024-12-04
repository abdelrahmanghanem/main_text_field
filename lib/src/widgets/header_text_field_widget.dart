import 'package:flutter/material.dart';

class HeaderFieldWidget extends StatelessWidget {
  final String title;
  final bool isRequired;
  final bool hideAsterisk;
  final TextStyle? titleStyle;

  const HeaderFieldWidget({
    super.key,
    required this.title,
    required this.isRequired,
    required this.hideAsterisk,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.bodySmall,
        ),
        if (isRequired && !hideAsterisk)
          Text(
            ' * ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          )
      ],
    );
  }
}
