import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse('https://videos.pexels.com/video-files/5386411/5386411-hd_720_1366_25fps.mp4')
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: VideoPlayer(
            controller,
          ),
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