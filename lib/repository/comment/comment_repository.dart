import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class CommentRepository with ApiBaseMethods {
  static final CommentRepository _singleton = CommentRepository._internal();
  factory CommentRepository() {
    return _singleton;
  }
  CommentRepository._internal();
  static const String prefix = "comment/";

/*   Future<List> specialistList({String query = ""}) async {
    Map<String, dynamic> response =
        await this.get(new Request(prefix + "list/?" + query));
    return Co.fromJson(response);
  } */
}
