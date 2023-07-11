import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/models/cart_model.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view_model.dart';
import 'package:flutter_siin_shop/utils/custom_text_style.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';
import 'package:flutter_siin_shop/widgets/app_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CartView extends StackedView<CartViewModel> {
  final bool withScaffold;

  const CartView({Key? key, this.withScaffold = false}) : super(key: key);

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            createHeader(viewModel),
            createSubTitle(viewModel),
            Expanded(
                child: SingleChildScrollView(
              child: createCartList(viewModel),
            )),
            footer(context, viewModel)
          ],
        ),
      ),
    );
  }

  footer(BuildContext context, CartViewModel vm) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "BD ${vm.totalAmount.toStringAsFixed(2)}",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          KAppButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Yet to Development"),
              ));
            },
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader(CartViewModel vm) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "SHOPPING CART",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 16, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle(CartViewModel vm) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(${vm.totalItem}) Items",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList(CartViewModel vm) {
    if (vm.cartItems.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 30.0),
        child: Text("No Items in Cart"),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        int key = vm.cartItems.keys.elementAt(position);
        CartModel cartItem = vm.cartItems[key]!;
        return createCartListItem(cartItem, vm);
      },
      itemCount: vm.cartItems.length,
    );
  }

  createCartListItem(CartModel item, CartViewModel vm) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                color: Colors.white,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: item.product.image,
                  placeholder: (ctx, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          item.product.title,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 6),
                      if(item.colorVariation!=null)
                        KColorVariationButton(color: item.colorVariation!,radius: 8, isSelected: true,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "BD ${(item.product.price*item.quantity).toStringAsFixed(2)}",
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      vm.reduceQuantity(item.product);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      item.quantity.toString(),
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      vm.addToCart(item.product);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: InkWell(
              onTap: (){
                dPrint("REMOVE");
                vm.removeFromCart(item.product);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.green),
          ),
        )
      ],
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) {
    return locator<CartViewModel>();
  }
}
