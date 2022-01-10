import 'package:location_specialist/helpers/models/media/media.dart';
import 'package:location_specialist/repository/model/request.dart';
import 'package:http/http.dart' as http;

class RequestFile extends Request {
  late Future<http.MultipartFile> file;
  Map<String, String> fileData;
  RequestFile(String url, {this.fileData = const {}, required Media bytes})
      : super(url) {
    file = http.MultipartFile.fromPath(bytes.name, bytes.path);
  }
}
