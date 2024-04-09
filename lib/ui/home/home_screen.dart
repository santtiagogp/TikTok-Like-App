import 'package:flutter/material.dart';

import 'widgets/video_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const VideoWidget(),
          const Align(
            alignment: Alignment.centerRight,
            child: HomeIconsWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.topCenter,
              height: 120,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(1, 1, 1, 0.95)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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