import 'package:flutter/material.dart';

class HeaderFieldWidget extends StatelessWidget {
  final String title;
  final bool isRequired;
  final TextStyle? titleStyle;

  const HeaderFieldWidget({
    super.key,
    required this.title,
    required this.isRequired,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.bodySmall,
          ),
          isRequired
              ? Text(
                  ' * ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
