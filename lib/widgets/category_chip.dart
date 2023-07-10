import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';

class CatChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  const CatChip({super.key, required this.title, required this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isActive ? KColors.accentLight : KColors.accentInactive,
          borderRadius: BorderRadius.circular(10.0),
          border: isActive ? Border.all(color: KColors.primary) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: (){
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? KColors.primary : KColors.primaryInactive, ),
            SizedBox(width: 5.0,),
            Text(title, style: TextStyle(color: isActive ? KColors.primary : KColors.primaryInactive, ),),
          ],
        ),
      ),
    );
  }
}
