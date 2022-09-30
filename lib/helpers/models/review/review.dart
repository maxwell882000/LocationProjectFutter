import 'package:location_specialist/helpers/interface/serialize_json_interface.dart';

class Review implements SerializeJsonInterface {
  late int review;
  late int user;

  Review({required this.review, required this.user});

  Review.fromJson(Map<String, dynamic> map) {
    print(map);
    print("empty");
    this.review = map['review'];
    this.user = map['user'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "review": this.review.toString(),
      'user': this.user.toString()
    };
  }
}
