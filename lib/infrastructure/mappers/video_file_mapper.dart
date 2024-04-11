import '../../domain/video/video_model.dart';
import '../helpers/mapper.dart';

class VideoFileMapper extends Mapper<VideoFile> {
  @override
  VideoFile fromMap(Map<String, dynamic> json) {
    return VideoFile(
      id: json['id'],
      quality: qualityValues.map[json["quality"]]!,
      width: json['width'],
      height: json['height'],
      fps: json['fps'],
      link: json['link']
    );
  }

  @override
  Map<String, dynamic> toMap(VideoFile data) => throw UnimplementedError();

}