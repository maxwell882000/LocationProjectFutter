import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';

class StarProvider extends BaseProvider {
  static const String SELECTED_STAR = "assets/review/star.png";
  static const String UNSELECTED_STAR = "assets/review/unstar.png";
  ServiceReviewInterface repo;

  StarProvider(this.repo);

  int _selected = 0;

  int get selected => _selected;

  set selected(int selected) {
    _selected = selected;
    if (_selected != 0) {
      repo.sendReview(selected);
      notifyListeners();
    }
  }

  Future<String?> getReview() async {
    int selected = await repo.getReview();
    this.selected = selected;
  }

  getStatus(int mark) {
    return _selected >= mark ? SELECTED_STAR : UNSELECTED_STAR;
  }

  @override
  initAsync() async {
    await getReview();
  }
}
