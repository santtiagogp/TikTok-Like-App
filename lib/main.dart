import 'package:flutter/material.dart';

void main() => runApp(const TikTokLikeApp());

class TikTokLikeApp extends StatelessWidget {
  const TikTokLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello, world!'),
        ),
      ),
    );
  }
}