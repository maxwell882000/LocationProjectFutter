import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/location/location.dart';
import 'package:location_specialist/routes/path.dart';

class LocationItem extends StatelessWidget {
  final Location location;
  const LocationItem({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {
        Get.offNamed(Path.LOCATION_PROFILE, arguments: location);
      },
      leading: Image.asset(
        "assets/images/location.png",
        height: 30,
        width: 30,
        fit: BoxFit.fill,
      ),
      title: Text(location.name),
    );
  }
}
