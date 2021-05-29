import 'package:flutter/material.dart';

import 'plant_tab_item.dart';

class PlantTabBar extends StatelessWidget {
  const PlantTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Row(
        children: [
          /// Concept Tab
          PlantTabItem(
            title: 'Concept',
            selected: true,
          ),

          /// Spacer
          Spacer(),

          /// Popular Tab
          PlantTabItem(title: 'Popular'),

          /// Spacer
          Spacer(),

          /// New Tab
          PlantTabItem(title: 'New'),

          /// Spacer
          Spacer(),
        ],
      ),
    );
  }
}
