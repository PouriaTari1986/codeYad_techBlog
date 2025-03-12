// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'My_Colors.dart';




class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.1,
      color: SolidColors.divider,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}