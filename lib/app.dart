import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/app_config.dart';
import 'package:flutter_siin_shop/router_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: kRouterConfig,
      debugShowCheckedModeBanner: false,
      title: AppConfig.name,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
