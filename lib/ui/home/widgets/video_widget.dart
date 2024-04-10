import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget(
    this.videoUrl,
    {super.key}
  );

  final String videoUrl;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl)
    )..initialize();

    controller.play();
    controller.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => controller.value.isPlaying
          ? controller.pause()
          : controller.play(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(
                controller,
              )
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: HomeIconsWidget(),
            ),
          ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HomeIconsWidget extends StatelessWidget {
  const HomeIconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 50,
            color: Colors.red
          ),
          SizedBox(height: 20),
          Icon(
            Icons.chat_bubble_rounded,
            size: 50,
            color: Colors.white
          ),
          SizedBox(height: 20),
          Icon(
            Icons.bookmark,
            size: 50,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}