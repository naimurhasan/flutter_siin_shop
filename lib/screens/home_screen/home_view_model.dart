import 'package:flutter/services.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/repositories/videos_api.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';
import 'package:stacked/stacked.dart';

class FeedViewModel extends BaseViewModel {
  VideosAPI? videoSource;

  int prevVideo = 0;

  int actualScreen = 0;

  FeedViewModel() {
    videoSource = locator<VideosAPI>();
  }

  changeVideo(index) async {
    if (videoSource!.listVideos[index].controller == null) {
      dPrint("LOAD CONTROLLER $index");
      await videoSource!.listVideos[index].loadController();
    }
    videoSource!.listVideos[index].controller!.play();

    if (videoSource!.listVideos[prevVideo].controller != null)
      videoSource!.listVideos[prevVideo].controller!.pause();

    prevVideo = index;
    dPrint("NOTIFIED $index");
    notifyListeners();

  }

  void pauseCurrentVideo(){
    if (videoSource!.listVideos[prevVideo].controller != null) {
      videoSource!.listVideos[prevVideo].controller!.pause();
    }
  }

  void loadVideo(int index) async {
    if (videoSource!.listVideos.length > index) {
      await videoSource!.listVideos[index].loadController();
      videoSource!.listVideos[index].controller?.play();

      notifyListeners();
    }
  }

  void setActualScreen(index) {
    actualScreen = index;
    if (index == 0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }
}
