import '../video_resp_model.dart';

abstract class VideoRespGateway {
  Future<VideoResponseModel> getVideos(int perPage);
}