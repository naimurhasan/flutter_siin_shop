import 'package:flutter_siin_shop/repositories/videos_api.dart';
import 'package:flutter_siin_shop/repositories/videos_api_impl.dart';
import 'package:flutter_siin_shop/screens/home_screen/feed_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void injectDependency() {
  locator.registerSingleton<VideosAPI>(VideosAPIImpl());
  locator.registerSingleton<FeedViewModel>(FeedViewModel());
}
