

import 'package:flutter_siin_shop/models/video_model.dart';
import 'package:flutter_siin_shop/repositories/data/demo_data.dart';

abstract class VideosAPI {
  late List<Video> listVideos;
  Future<void> load();
  Future<List<Video>> getVideoList();
}
