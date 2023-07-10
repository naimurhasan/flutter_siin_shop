import 'package:flutter_siin_shop/models/video_model.dart';

abstract class VideosAPI {
  late List<Video> listVideos;
  Future<void> load();
  Future<List<Video>> getVideoList();
}
