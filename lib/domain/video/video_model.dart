class VideoModel {

  VideoModel({
    required this.width,
    required this.height,
    required this.duration,
    required this.fullRes,
    required this.tags,
    required this.url,
    required this.image,
    required this.videoFiles,
  });

    final int width;
    final int height;
    final int duration;
    final dynamic fullRes;
    final List<dynamic> tags;
    final String url;
    final String image;
    final List<VideoFile> videoFiles;

}

class VideoFile {
    final int id;
    final Quality quality;
    final int width;
    final int height;
    final double fps;
    final String link;

    VideoFile({
      required this.id,
      required this.quality,
      required this.width,
      required this.height,
      required this.fps,
      required this.link,
    });

}

enum Quality {
    hd,
    sd,
    uhd
}