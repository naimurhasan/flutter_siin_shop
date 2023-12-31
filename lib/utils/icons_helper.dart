/// Flutter icons VideoSlidingIcons | TikTokIcons
/// Copyright (C) 2019 by original authors @ fluttericon.com, fontello.com
/// This font was generated by FlutterIcon.com, which is derived from Fontello.
///
/// To use this font, place it in your fonts/ directory and include the
/// following in your pubspec.yaml
///
/// flutter:
///   fonts:
///    - family:  VideoSlidingIcons
///      fonts:
///       - asset: fonts/TikTokIcons.ttf
///
/// 
///
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoSlidingIcons {
  VideoSlidingIcons._();

  static const _kFontFam = 'VideoSlidingIcons';

  static const IconData chat_bubble = const IconData(0xe808, fontFamily: _kFontFam);
  static const IconData create = const IconData(0xe809, fontFamily: _kFontFam);
  static const IconData heart = const IconData(0xe80a, fontFamily: _kFontFam);
  static const IconData home = const IconData(0xe80b, fontFamily: _kFontFam);
  static const IconData messages = const IconData(0xe80c, fontFamily: _kFontFam);
  static const IconData profile = const IconData(0xe80d, fontFamily: _kFontFam);
  static const IconData reply = const IconData(0xe80e, fontFamily: _kFontFam);
  static const IconData search = const IconData(0xe80f, fontFamily: _kFontFam);
}

IconData geIconForCategory(String name){
  switch(name){
    case "electronics":
      return Icons.electrical_services;
    case "jewelery":
      return Icons.ac_unit;
    case "men's clothing":
      return Icons.male;
    case "women's clothing":
      return Icons.female;
    default:
      return Icons.local_fire_department;
  }
}