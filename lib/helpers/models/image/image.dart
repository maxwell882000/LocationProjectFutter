import 'package:location_specialist/helpers/models/base/base_model.dart';

class Image extends BaseModel{
  late String images;
  Image.fromJson(Map<String, dynamic> map):super.fromJson(map)  {
    this.images = map['images'];
  }

  Map<String, String> toJson() {
    return <String, String>{
      'images': this.images
    };
  }
  

}
