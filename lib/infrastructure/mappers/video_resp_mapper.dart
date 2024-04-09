import '../../domain/video/video_model.dart';
import '../../domain/video_resp/video_resp_model.dart';
import '../helpers/mapper.dart';
import 'video_model_mapper.dart';

class VideoRespMapper extends Mapper<VideoResponseModel> {
  @override
  VideoResponseModel fromMap(Map<String, dynamic> json) {
    return VideoResponseModel(
      page: json['page'],
      perPage: json['per_page'],
      videos: List<VideoModel>.from(
        json["videos"].map((x) => VideoModelMapper().fromMap(x))
      ),
      totalResults: json['total_results'],
      nextPage: json['next_page'],
      url: json['url']
    );
  }

  @override
  Map<String, dynamic> toMap(VideoResponseModel data)
    => throw UnimplementedError();
  
}