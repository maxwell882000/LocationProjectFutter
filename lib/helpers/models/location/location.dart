import 'package:location_specialist/helpers/models/image/image.dart';

class Location {
  late String country;
  late String city;
  late String district;
  late String description;
  late double latitude;
  late double longitude;
  late List<Image> images;
  Location.fromJson(Map<String, dynamic> map) {
    this.country = map['country'];
    this.city = map['city'];
    this.district = map['district'];
    this.description = map['description'];
    this.latitude = map['latitude'];
    this.longitude = map['longitude'];
    this.images = map['images'].map((e) => Image.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'country':this.country, 
      'city' :this.city, 
      'district':this.district,
      'description':this.description,
      'latitude': this.latitude,
      'longitude' : this.longitude,
    };
  }
}
