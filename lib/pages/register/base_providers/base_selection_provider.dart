import 'package:location_specialist/helpers/models/base/base_model.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';

abstract class BaseSelectionProvider<T extends BaseModel> extends BaseProvider {
  List<T> _selection = [];

  List<T> get selection => _selection;

  BaseSelectionProvider();

  set selection(List<T> selection) {
    _selection = selection;
    notifyListeners();
  }

  @override
  List<int> getIds(List values) {
    return values.map<int>((e) => this.selection[e].id).toList();
  }
  List<String> getNames();
}
