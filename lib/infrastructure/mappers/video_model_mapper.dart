import '../../domain/video/video_model.dart';
import '../helpers/mapper.dart';
import 'video_file_mapper.dart';

class VideoModelMapper extends Mapper<VideoModel> {
  @override
  VideoModel fromMap(Map<String, dynamic> json) {
    return VideoModel(
      width: json['width'],
      height: json['height'],
      duration: json['duration'],
      fullRes: json['full_res'],
      url: json['url'],
      image: json['image'],
      videoFiles: List<VideoFile>.from(
        json["video_files"].map((x) => VideoFileMapper().fromMap(x))
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(VideoModel data) => throw UnimplementedError();
  
}