import 'package:location_specialist/helpers/models/category/category.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/helpers/models/paginator/paginator.dart';

class LocationPaginate extends Paginator<Location> {
  LocationPaginate() : super();
  LocationPaginate.fromJson(Map<String, dynamic> map) : super.fromJson(map);

  @override
  List<Location> results(Map<String, dynamic> map) {
    return map['results'].map<Location>((e) => Location.fromJson(e)).toList();
  }
}
