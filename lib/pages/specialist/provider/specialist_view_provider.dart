import 'package:get/get.dart';
import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/helpers/models/review/review_specialist.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/comment/comment_specialist_repository.dart';

class SpecialistViewProvider extends BaseProvider
    implements ServiceReviewInterface {
  late Specialist specialist;
  SpecialistViewProvider() {
    this.specialist = Get.arguments as Specialist;
    initAsync();
  }

  addComment(Comment comment) {
    if (AuthProvider.auth.user != null) {
      comment.user = AuthProvider.auth.user!;
    }
    this.specialist.comments.add(comment);
    notifyListeners();
  }

  set review(Review review) {
    this.specialist.review = review;
    notifyListeners();
  }

  @override
  Future initAsync() async {
    List<Comment> comments =
        await CommentSpecialistRepository().getComments(specialist.id);
    specialist.comments = comments;
    notifyListeners();
  }

  @override
  Future sendComment(String text) async {
    Comment comment = await CommentSpecialistRepository()
        .setComment(this.specialist.id, text);
    this.addComment(comment);
  }

  @override
  sendReview(int review) async {
    Review newReview = await CommentSpecialistRepository()
        .setReview(ReviewSpecialist(review: review, specialist: specialist.id));
    this.review = newReview;
  }

  @override
  Future<int> getReview() async {
    if (this.specialist.review != null) {
      return this.specialist.review!.review;
    }
    Review? review =
        await CommentSpecialistRepository().getReview(specialist.id);
    if (review != null) {
      this.review = review;
      return review.review;
    }
    return 0;
  }
}
