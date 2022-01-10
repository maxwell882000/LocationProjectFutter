import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

abstract class CommentRepository with ApiBaseMethods {
  static const String prefix = "comment/";

  String getSpecificUrl();

  Future<List<Comment>> getComments(int id) async {
    Map<String, dynamic> comments =
        await this.get(new Request(this.constractCommentUrl(id)));
    return comments['comments']
        .map<Comment>((e) => Comment.fromJson(e))
        .toList();
  }

  String constractCommentUrl(int id) {
    return prefix + getSpecificUrl() + id.toString() + '/';
  }

  Future<Comment> setComment(int id, String comment) async {
    final response = await this.post(
        new Request(this.constractCommentUrl(id), data: {'comment': comment}));
    return Comment.fromJson(response);
  }

  Future<Review> setReview(Review review) async {
    final response = await this.post(new Request(
        prefix + getSpecificUrl() + 'review/',
        data: review.toJson()));
    return Review.fromJson(response);
  }

  Future<Review?> getReview(int id) async {
    final Map<String, dynamic> response = await this.get(
        new Request(prefix + getSpecificUrl() + 'review/${id.toString()}/'));
    if (response.isEmpty) {
      return null;
    }
    return Review.fromJson(response);
  }
}
