import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/models/category_model.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_view_model.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';
import 'package:flutter_siin_shop/utils/icons_helper.dart';

class CatChip extends StatelessWidget {
  final Category category;
  final bool isActive;
  const CatChip({super.key, required this.category,  this.isActive = false,});

  @override
  Widget build(BuildContext context) {
    final vm = locator<CategoryViewModel>();
    bool isActive = vm.selectedCategory == category;
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
          dPrint("INKWELL ON TAP ${category.name}");
          if(isActive) {
            vm.actionFilterCat(null);
          } else {
            vm.actionFilterCat(category);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(geIconForCategory(category.name), color: isActive ? KColors.primary : KColors.primaryInactive, ),
            SizedBox(width: 5.0,),
            Text(category.name.capitalize(), style: TextStyle(color: isActive ? KColors.primary : KColors.primaryInactive, ),),
          ],
        ),
      ),
    );
  }
}
