import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_screen.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_screen.dart';
import 'package:flutter_siin_shop/screens/home_screen/home_scree.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// sub screens list
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        notchColor: Colors.white,
        /// restart app if you change removeMargins
        removeMargins: true,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: const [
           BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.grid_view,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.grid_view,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Cats',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: Colors.pink,
            ),
            itemLabel: 'Cart',
          ),
        ],
        onTap: (index) {
          /// update page
          dPrint('current selected index $index');
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}


