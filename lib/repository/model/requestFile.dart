import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/repository/model/request.dart';

class RequestFile extends Request {
  late List<http.MultipartFile> files;
  RequestFile(String url,
      {Map<String, String> data = const {},
      List<Media> listBytes = const []})
      : super(url, data: data) {
    files = listBytes
        .map<http.MultipartFile>(
            (e) => http.MultipartFile.fromBytes(e.name, e.bytes, contentType:e.media))
        .toList();

  }
}
