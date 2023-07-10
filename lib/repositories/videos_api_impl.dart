import 'package:flutter_siin_shop/models/video_model.dart';
import 'package:flutter_siin_shop/repositories/data/video_demo_data.dart';
import 'package:flutter_siin_shop/repositories/videos_api.dart';

class VideosAPIImpl implements VideosAPI{
  List<Video> listVideos = <Video>[];

  VideosAPIImpl() {
    load();
  }

  Future<void> load() async {
    listVideos = await getVideoList();
  }

  Future<List<Video>> getVideoList() async {

    var videoList = <Video>[];

    videoDemoData.forEach((element) {
      Video video = Video.fromJson(element);
      videoList.add(video);
    });

    return videoList;
  }


}
