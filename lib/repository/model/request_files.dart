import 'package:http/http.dart' as http;
import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/repository/model/request.dart';

class RequestFiles extends Request {
  late List<Future<http.MultipartFile>> files;
  Map<String, String> fileData;
  RequestFiles(String url,
      {this.fileData = const {}, List<Media> listBytes = const []})
      : super(url) {
    files = listBytes
        .map<Future<http.MultipartFile>>((e) async =>
            await http.MultipartFile.fromPath(e.name, e.path,))
        .toList();
  }
}
