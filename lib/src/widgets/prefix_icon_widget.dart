import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrefixIconWidget extends StatelessWidget {
  final Color? color;
  final String assetPath;
  const PrefixIconWidget({super.key, this.color, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).primaryColor,
        BlendMode.srcIn,
      ),
    );
  }
}
