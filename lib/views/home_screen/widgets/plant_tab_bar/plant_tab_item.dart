import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop/utils/theme.dart';
import 'package:plant_shop/widgets/touchable_opacity.dart';


/// A Custom Tab item for home screen
class PlantTabItem extends StatelessWidget {
  final bool selected;
  final String? title;
  const PlantTabItem({
    Key? key,
    this.selected = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: GoogleFonts.lato(
              fontSize: 17,
              color: selected == true ? black : kPlanGrey,
              fontWeight: selected == true ? FontWeight.w800 : FontWeight.w900,
            ),
          ),
          Gap(5),
          ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Container(
              height: 3,
              width: 19,
              color: selected ? kPlanGreen : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
