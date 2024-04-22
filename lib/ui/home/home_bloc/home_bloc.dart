import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/video/video_model.dart';
import '../../../infrastructure/driven_adapters/videos_api/videos_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final VideosApi _videosApi;
  List<VideoModel> videos = [];

  HomeBloc(this._videosApi) : super(HomeInitial()) {

    on<OnInit>((event, emit) async {
      emit(HomeLoading());
      if(videos.isEmpty) {
        final resp = await _videosApi.getVideos(5);
        videos = resp.videos;
        emit(HomeFetched(videos, false));
      } else {
        HomeFetched(videos, true);
      }
    });

    on<ReachFinal>((event, emit) async {
      emit(HomeInitial());
      final resp = await _videosApi.getNextVideos();
      for (var video in resp.videos) {
        videos.add(video);
      }
      emit(HomeFetched(videos, true));
    });
    
  }

}


