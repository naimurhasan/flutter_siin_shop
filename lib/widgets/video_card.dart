import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/models/video_model.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';
import 'package:flutter_siin_shop/widgets/actions_toolbar.dart';
import 'package:flutter_siin_shop/widgets/video_description.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({super.key, required this.video});


  @override
  Widget build(BuildContext context) {

    double? vidWidth = video.controller?.value.size.width;
    double? vidHeight = video.controller?.value.size.height;
    dPrint("${vidWidth} video sizes");
    dPrint("${vidHeight} video sizes");
    if(vidWidth==null || vidWidth==0){
      vidWidth = MediaQuery.of(context).size.width;
      vidHeight = MediaQuery.of(context).size.height;
    }
    dPrint("a${vidWidth} video sizes");
    dPrint("a ${vidHeight} video sizes");
    
    
    return Stack(
      children: [
        video.controller != null
            ? GestureDetector(
          onTap: () {
            print("video.controller tap");
            if (video.controller!.value.isPlaying) {
              video.controller?.pause();
            } else {
              video.controller?.play();
            }
          },
          child: SizedBox.expand(
              child: Container(
                color: Colors.black45,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: vidWidth,
                    height: vidHeight,
                    child: VideoPlayer(video.controller!),
                  ),
                ),
              )),
        )
            : Container(
          color: Colors.black87,
          child: Center(
            child: SpinKitFoldingCube(color: Colors.white,),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(video.user, video.videoTitle, video.songName),
                ActionsToolbar(video.likes, video.comments,
                    "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
              ],
            ),
            SizedBox(height: 80)
          ],
        ),
      ],
    );
  }
}
