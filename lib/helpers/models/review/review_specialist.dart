import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class ReviewSpecialist extends Review {
  final int specialist;

   ReviewSpecialist(
      {required int review, int user = 0, required this.specialist})
      : super(review: review, user: user);
/*   ReviewSpecialist.fromJson(Map<String, dynamic> map) : super.fromJson(map); */

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map['specialist'] = this.specialist.toString();
    return map;
  }
}
