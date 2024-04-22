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
      if(_controller.page == bloc.videos.length - 2) {
        bloc.add(ReachFinal());
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
              return PageView.builder(
                controller: _controller,
                itemCount: state.videos.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return VideoWidget(state.videos[index].videoFiles[1].link);
                },
              );
            } else {
              return const CircularProgressIndicator();
            }

          },
        ),
      )
    );
  }
}