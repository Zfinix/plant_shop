import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/utils/extensions.dart';

class PlantIcons extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  const PlantIcons({
    Key? key,
    required this.icon,
    this.onPressed,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      icon: SvgPicture.asset(icon.svg),
      onPressed: onPressed ?? () {},
    );
  }
}
