import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc/home_bloc.dart';
import 'widgets/video_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final PageController _controller;

  bool firstTime = true;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<HomeBloc>(context);

    _controller.addListener(() {
      if(_controller.page == bloc.videos.length - 1) {
        bloc.add(ReachFinal());
        print('Reached final');
      }
    });

    if(firstTime) {
      bloc.add(OnInit());
      firstTime = false;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {

            if(state is HomeFetched) {

              final videos = state.videos;

              return PageView.builder(
                physics: const ClampingScrollPhysics(),
                controller: _controller,
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoWidget(
                    videos[index].videoFiles[1].link
                    //index 1 is always HD on API
                  );
                }
              );
            } else {
              return const Center(
                child: CircularProgressIndicator()
              );
            }

          },
        ),
      )
    );
  }
}