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

class _VideoWidgetState extends State<VideoWidget> with SingleTickerProviderStateMixin {

  late VideoPlayerController controller;
  late AnimationController animController;
  bool showPause = false;

  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl)
    )..initialize();

    controller.play();
    controller.setLooping(true);

    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          controller.value.isPlaying ? controller.pause() : controller.play();
          if(showPause == false) {
            animController.forward();
            showPause = true;
          } else {
            animController.reverse();
            showPause = false;
          }
        },
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
            Align(
              heightFactor: 18,
              alignment: Alignment.bottomRight,
              child: AnimatedIcon(
                color: Colors.black,
                icon: AnimatedIcons.play_pause,
                progress: animController,
                size: 50,
              ),
            )
          ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    animController.dispose();
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