import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/app.dart';
import 'package:flutter_siin_shop/injection_container.dart';

void main() {
  injectDependency();
  runApp(const MyApp());
}
