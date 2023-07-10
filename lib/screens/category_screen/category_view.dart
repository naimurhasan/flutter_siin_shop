import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_view_model.dart';
import 'package:flutter_siin_shop/widgets/category_chip.dart';
import 'package:flutter_siin_shop/widgets/product_grid_item.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catViewModel = locator<CategoryViewModel>();

    return ViewModelBuilder<CategoryViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => buildView(catViewModel),
        viewModelBuilder: () => catViewModel);
  }

  Widget buildView(CategoryViewModel catViewModel) {
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
            child: ListView.builder(
              itemCount: catViewModel.categoryList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 5.0),
              scrollDirection: Axis.horizontal, itemBuilder: (BuildContext context, int index) {
                final item =  catViewModel.categoryList[index];
                return CatChip(category: item,);
            },

            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(child:
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),

            shrinkWrap: true,
            physics: BouncingScrollPhysics(),

            gridDelegate: const FlutterzillaFixedGridView(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                height: 250),
            itemBuilder: (BuildContext context, int index) {
              return ProductGridItem(product: catViewModel.productList[index],);
            },
          ),
          ),
        ],
      ),
    );
  }

}