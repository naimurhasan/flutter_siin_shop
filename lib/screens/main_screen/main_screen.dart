import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view_model.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_view.dart';
import 'package:flutter_siin_shop/screens/home_screen/home_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:badges/badges.dart' as badges;

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
    const HomeView(),
    const CategoryView(),
    const CartView(),
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
            child: ViewModelBuilder<CartViewModel>.reactive(
                disposeViewModel: false,
                builder: (context, vm, child) {
                  return GNav(
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
                        icon: Icons.shopping_bag_rounded,
                        text: 'Cart',
                        leading: selectedIndex == 2 || vm.totalItem == 0
                            ? null
                            : badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.circle,
                                  badgeColor: Colors.red,
                                  padding: EdgeInsets.all(4),
                                  elevation: 0,
                                ),
                                badgeContent: Text(
                                  vm.totalItem.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.shopping_bag_rounded,
                                  size: 20,
                                  color: selectedIndex == 1
                                      ? Colors.pink
                                      : Colors.black,
                                ),
                              ),
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.bounceInOut);
                    },
                  );
                },
                viewModelBuilder: () => locator<CartViewModel>()),
          ),
        ),
      ),
    );
  }
}
