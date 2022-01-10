import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/repository/comment/comment_repository.dart';

class CommentLocationRepository extends CommentRepository {
  static final CommentLocationRepository _singleton =
      CommentLocationRepository._internal();

  factory CommentLocationRepository() {
    return _singleton;
  }
  CommentLocationRepository._internal();

  @override
  String getSpecificUrl() {
    return "location/";
  }

}
