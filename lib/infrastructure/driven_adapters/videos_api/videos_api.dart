import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/video_resp/gateway/video_resp_gateway.dart';
import '../../../domain/video_resp/video_resp_model.dart';
import '../../helpers/videos_helpers.dart';
import '../../mappers/video_resp_mapper.dart';

class VideosApi extends VideoRespGateway {

  late String _nextVideosUri;

  final Map<String, String> reqHeaders = {
    'Content-type': 'application/json',
    'Authorization': 'rsRidR77mu0XkWYFMciLCzeTzCoHGo9tfBlgpCDKi0w2JRioENzOwLIC'
  };

  @override
  Future<VideoResponseModel> getVideos(int perPage) async {
    final Uri url = Uri.parse("${VideosHelpers.videosApi}/popular?per_page=$perPage&min_width=1080&min_height=1920");
    final resp = await http.get(url, headers: reqHeaders);
    if(resp.statusCode == 200) {
      final data = VideoRespMapper().fromMap(jsonDecode(resp.body));
      _nextVideosUri = data.nextPage;
      return data;
    } else {
      throw Exception();
    }
  }
  
  @override
  Future<VideoResponseModel> getNextVideos() async {
    final Uri url = Uri.parse(_nextVideosUri);
    final resp = await http.get(url, headers: reqHeaders);
    if(resp.statusCode == 200) {
      final data = VideoRespMapper().fromMap(jsonDecode(resp.body));
      return data;
    } else {
      throw Exception();
    }
  }
  
}