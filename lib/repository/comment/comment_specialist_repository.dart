import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/repository/comment/comment_repository.dart';

class CommentSpecialistRepository extends CommentRepository {
  static final CommentSpecialistRepository _singleton =
      CommentSpecialistRepository._internal();

  factory CommentSpecialistRepository() {
    return _singleton;
  }
  CommentSpecialistRepository._internal();

  @override
  String getSpecificUrl() {
    return "specialist/";
  }
}
