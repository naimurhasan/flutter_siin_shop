import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_screen.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_screen.dart';
import 'package:flutter_siin_shop/screens/home_screen/home_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  /// Controller to handle bottom nav bar and also handles initial page
  // final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// sub screens list
  final List<Widget> bottomBarPages = [
    const CategoryScreen(),
    const HomeScreen(),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_bag_rounded,
                  text: 'Shop',
                ),
                GButton(
                  icon: Icons.shopping_cart_rounded,
                  text: 'Cart',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
              },
            ),
          ),
        ),
      ),
      // extendBody: true,
      // bottomNavigationBar: AnimatedNotchBottomBar(
      //   /// Provide NotchBottomBarController
      //   notchBottomBarController: _controller,
      //   color: Colors.white,
      //   showLabel: false,
      //   notchColor: Colors.white,
      //   /// restart app if you change removeMargins
      //   removeMargins: true,
      //   bottomBarWidth: 500,
      //   durationInMilliSeconds: 300,
      //   bottomBarItems: const [
      //      BottomBarItem(
      //       inActiveItem: Icon(
      //         Icons.home_filled,
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Icon(
      //         Icons.home_filled,
      //         color: Colors.blueAccent,
      //       ),
      //       itemLabel: 'Home',
      //     ),
      //     BottomBarItem(
      //       inActiveItem: Icon(
      //         Icons.grid_view,
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Icon(
      //         Icons.grid_view,
      //         color: Colors.blueAccent,
      //       ),
      //       itemLabel: 'Cats',
      //     ),
      //     BottomBarItem(
      //       inActiveItem: Icon(
      //         Icons.shopping_cart,
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Icon(
      //         Icons.shopping_cart,
      //         color: Colors.pink,
      //       ),
      //       itemLabel: 'Cart',
      //     ),
      //   ],
      //   onTap: (index) {
      //     /// update page
      //     dPrint('current selected index $index');
      //     _pageController.jumpToPage(index);
      //   },
      // ),
    );
  }
}


