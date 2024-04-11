import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'infrastructure/driven_adapters/videos_api/videos_api.dart';
import 'ui/home/home_bloc/home_bloc.dart';

import 'ui/home/home_screen.dart';

void main() => runApp(const TikTokLikeApp());

class TikTokLikeApp extends StatelessWidget {
  const TikTokLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(VideosApi()),
      child: const MaterialApp(
        title: 'TikTok Like App',
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}