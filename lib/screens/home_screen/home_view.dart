import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/screens/home_screen/home_view_model.dart';
import 'package:flutter_siin_shop/widgets/video_card.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final feedViewModel = locator<FeedViewModel>();

  @override
  void initState() {
    feedViewModel.loadVideo(0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => buildScreen(),
        viewModelBuilder: () => feedViewModel);
  }

  Widget buildScreen() {
   return Stack(
      children: [
        PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: feedViewModel.videoSource?.listVideos.length,
          onPageChanged: (index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            feedViewModel.changeVideo(index);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            return VideoCard(video: feedViewModel.videoSource!.listVideos[index],);
          },
        ),
      ],
    );
  }


}