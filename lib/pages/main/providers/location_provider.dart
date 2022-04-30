import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/pages/main/widgets/home/adds.dart';

class LocationProvider extends BaseProvider {
  late List<Location> locations = [];
  late List<Adds> adds = [];

  @override
  initAsync() {}
}
