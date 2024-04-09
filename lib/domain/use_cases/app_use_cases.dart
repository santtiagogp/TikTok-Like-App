import '../video_resp/gateway/video_resp_gateway.dart';
import '../video_resp/video_resp_model.dart';

class AppUseCases {
  AppUseCases(this.videoRespGateway);

  final VideoRespGateway videoRespGateway;

  Future<VideoResponseModel> getVideos(int perPage)
    => videoRespGateway.getVideos(perPage);
}