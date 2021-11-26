import 'package:location_specialist/helpers/models/paginator/paginator.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';

class SpecialistPaginate extends Paginator<Specialist> {
  SpecialistPaginate() : super();

  SpecialistPaginate.fromJson(Map<String, dynamic> map) : super.fromJson(map);

  @override
  List<Specialist> results(Map<String, dynamic> map) {
    return map['results']
        .map<Specialist>((e) => Specialist.fromJson(e))
        .toList();
  }
}
