import 'package:flutter_siin_shop/repositories/products_api.dart';
import 'package:flutter_siin_shop/repositories/products_api_impl.dart';
import 'package:flutter_siin_shop/repositories/videos_api.dart';
import 'package:flutter_siin_shop/repositories/videos_api_impl.dart';
import 'package:flutter_siin_shop/screens/category_screen/category_view_model.dart';
import 'package:flutter_siin_shop/screens/home_screen/home_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void injectDependency() {
  // api
  locator.registerSingleton<VideosAPI>(VideosAPIImpl());
  locator.registerSingleton<ProductsApi>(ProductsApiImpl());

  // view model
  locator.registerSingleton<FeedViewModel>(FeedViewModel());
  locator.registerSingleton<CategoryViewModel>(CategoryViewModel());
}
