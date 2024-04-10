import 'package:flutter/material.dart';
import 'widgets/video_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
        ],
      )
    );
  }
}