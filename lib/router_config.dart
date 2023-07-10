import 'package:flutter_siin_shop/screens/main_screen/main_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final kRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
  ],
);