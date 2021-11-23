import 'package:location_specialist/helpers/models/review/review.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class ReviewSpecialist extends Review {
  late Specialist specialist;

  ReviewSpecialist.fromJson(Map<String, dynamic> map) : super.fromJson(map);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map['specialist'] = this.specialist.t
  }
}
