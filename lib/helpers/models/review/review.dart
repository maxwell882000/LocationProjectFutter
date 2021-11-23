import 'package:location_specialist/helpers/models/user/user.dart';

class Review {
  late int review;
  late User user;
  Review.fromJson(Map<String, dynamic> map) {
    this.review = map['review'];
    this.user = User.fromJson(map['user']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "review": this.review,
      'user':this.user
    };
  }
}
