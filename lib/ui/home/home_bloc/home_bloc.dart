import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/video/video_model.dart';
import '../../../infrastructure/driven_adapters/videos_api/videos_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final VideosApi _videosApi;

  HomeBloc(this._videosApi) : super(HomeInitial()) {

    on<OnInit>((event, emit) async {
      emit(HomeLoading());
      final resp = await _videosApi.getVideos(5);
      emit(HomeFetched(resp.videos, false));
    });
  }

}


