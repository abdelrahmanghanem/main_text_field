import 'package:flutter/material.dart';

class LabelRequiredWidget extends StatelessWidget {
  final String label;
  final bool isRequired;
  const LabelRequiredWidget({
    super.key,
    required this.label,
    required this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    height: .7,
                    fontSize: 7,
                  ),
            ),
        ],
      ),
      style: TextStyle(
        color: Colors.grey.shade800,
        height: .7,
      ),
    );
  }
}
