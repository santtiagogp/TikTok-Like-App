import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc/home_bloc.dart';
import 'widgets/video_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<HomeBloc>(context);

    bloc.add(OnInit());

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