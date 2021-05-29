import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:plant_shop/widgets/plant_icon.dart';

/// A simple Plant App bar for Home screen
class PlantAppBar extends StatelessWidget {
  const PlantAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Row(
        children: [
          /// Menu
          PlantIcons(icon: 'menu'),

          /// Spacer
          Spacer(),

          /// Cart icon
          PlantIcons(
            icon: 'cart_icon',
            padding: EdgeInsets.zero,
          ),

          /// Spacing
          Gap(26),

          /// Search icon
          PlantIcons(
            icon: 'search_icon',
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}

