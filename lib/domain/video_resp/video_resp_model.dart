import '../video/video_model.dart';

class VideoResponseModel {
    final int page;
    final int perPage;
    final List<VideoModel> videos;
    final int totalResults;
    final String nextPage;
    final String url;

    VideoResponseModel({
      required this.page,
      required this.perPage,
      required this.videos,
      required this.totalResults,
      required this.nextPage,
      required this.url,
    });
}