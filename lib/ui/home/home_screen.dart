import 'package:flutter/material.dart';
import 'widgets/video_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: PageView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            VideoWidget('https://videos.pexels.com/video-files/5386411/5386411-hd_720_1366_25fps.mp4'),
            VideoWidget('https://videos.pexels.com/video-files/6963395/6963395-hd_1080_1920_25fps.mp4'),
            VideoWidget('https://videos.pexels.com/video-files/7438482/7438482-hd_1080_1872_30fps.mp4'),
            VideoWidget('https://videos.pexels.com/video-files/1409899/1409899-hd_1280_720_25fps.mp4')
          ],
        ),
      )
    );
  }
}