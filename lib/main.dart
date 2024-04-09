import 'package:flutter/material.dart';
import 'ui/home/home_screen.dart';

void main() => runApp(const TikTokLikeApp());

class TikTokLikeApp extends StatelessWidget {
  const TikTokLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TikTok Like App',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}