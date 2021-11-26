import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/bottom_navigation/bottom_navigation_item.dart';
import 'package:location_specialist/pages/main/widgets/category/category_list.dart';
import 'package:location_specialist/pages/main/widgets/home/home.dart';
import 'package:location_specialist/pages/main/widgets/specialist/specialist_list.dart';

class MainPorivder with ChangeNotifier {
  int _index = 0;
  PageController controller = new PageController(initialPage: 0);
  void currentPage(int index) {
    controller.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  final List<BottomNavigationItem> footer = const [
    BottomNavigationItem("assets/icons/search.png", Home()),
    BottomNavigationItem("assets/icons/segment-path.png", CategoryList()),
    BottomNavigationItem("assets/icons/star.png", SpecialistList()),
    BottomNavigationItem("assets/icons/wallet.png", SizedBox()),
  ];

  Widget get body => footer[_index].body;

  List<Widget> get children => footer.map<Widget>((e) => e.body).toList();
}
