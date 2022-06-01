import 'package:flutter/material.dart';

import 'my_colors.dart';

class TechDivaider extends StatelessWidget {
  const TechDivaider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divaiderColor,
      indent: size.width / 5,
      endIndent: size.width / 5,
    );
  }
}
