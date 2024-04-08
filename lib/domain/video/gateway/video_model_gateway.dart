import '../video_model.dart';

abstract class VideoModelGateway {
  Future<VideoModel> getVideo();
}