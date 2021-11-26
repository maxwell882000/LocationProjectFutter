import 'package:location_specialist/helpers/models/add/add.dart';
import 'package:location_specialist/repository/mixin/api_base_methods.dart';
import 'package:location_specialist/repository/model/request.dart';

class AddRepository with ApiBaseMethods {
  static final AddRepository _singleton = AddRepository._internal();
  factory AddRepository() {
    return _singleton;
  }
  static const String prefix = "add/";
  AddRepository._internal();
  Future<List<Add>> addList() async {
    List list = await this.get(new Request(prefix + "list/"));
    return list.map((e) => Add.fromJson(e)).toList();
  }
}
