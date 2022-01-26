import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/helpers/models/review/review_location.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/repository/comment/comment_location_repository.dart';

class LocationCommentProvider
    with ChangeNotifier
    implements ServiceReviewInterface {
  late Location _location;
  LocationCommentProvider() {
    _location = Get.arguments as Location;
    initAsync();
  }
  Location get location => _location;
  Future initAsync() async {
    List<Comment> comments =
        await CommentLocationRepository().getComments(location.id);
    location.comments = comments;
    notifyListeners();
  }

  set location(Location location) {
    _location = location;
    notifyListeners();
  }

  set review(Review review) {
    _location.review = review;
    notifyListeners();
  }

  @override
  sendReview(int review) async {
    if (review != 0) {
      Review newReview = await CommentLocationRepository()
          .setReview(ReviewLocation(review: review, location: location.id));
      this.review = newReview;
    }
  }

  @override
  sendComment(String text) async {
    Comment comment =
        await CommentLocationRepository().setComment(this.location.id, text);
    this.addComment(comment);
  }

  @override
  Future<int> getReview() async {
    if (this._location.review != null) {
      return this._location.review!.review;
    }
    Review? review = await CommentLocationRepository().getReview(_location.id);
    if (review != null) {
      this.review = review;
      return review.review;
    }
    return 0;
  }

  void addComment(Comment comment) {
    if (AuthProvider.auth.user != null) {
      comment.user = AuthProvider.auth.user!;
    }
    this.location.comments.add(comment);
    notifyListeners();
  }
}
