import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';
import 'package:flutter_siin_shop/widgets/category_chip.dart';
import 'package:flutter_siin_shop/widgets/product_grid_item.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                labelText: "Search the Siin...",
                prefixIcon: Icon(Icons.search),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          SizedBox(
            height: 40.0,
            child: ListView(
              padding: const EdgeInsets.only(left: 5.0),
              scrollDirection: Axis.horizontal,
              children: [
                CatChip(title: "Trending", icon: Icons.local_fire_department_rounded, isActive: true,),
                CatChip(title: "New", icon: Icons.access_time_rounded, isActive: false,),
                CatChip(title: "Mackup", icon: Icons.padding, isActive: false,),
                CatChip(title: "Mens Fashion", icon: Icons.male, isActive: false,),
                CatChip(title: "Womens Fashion", icon: Icons.female, isActive: false,),
                CatChip(title: "Kids Fashion", icon: Icons.person, isActive: false,),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(child:
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            gridDelegate: const FlutterzillaFixedGridView(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                height: 250),
            children: [
              ProductGridItem(),
              ProductGridItem(),
              ProductGridItem(),
              ProductGridItem(),
            ],
          ),
          ),
        ],
      ),
    );
  }
}