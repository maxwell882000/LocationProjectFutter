import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/bottom_navigation/bottom_navigation_item.dart';
import 'package:location_specialist/pages/main/widgets/home/home.dart';

class MainPorivder with ChangeNotifier {
  int _index = 0;
  PageController controller = new PageController(initialPage: 0);
  void currentPage(int index) {
    controller.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
    notifyListeners();
  }

  final List<BottomNavigationItem> footer = const [
    BottomNavigationItem("assets/icons/search.png", Home()),
    BottomNavigationItem("assets/icons/segment-path.png", Home()),
    BottomNavigationItem("assets/icons/wallet.png", SizedBox()),
    BottomNavigationItem("assets/icons/star.png", SizedBox()),
  ];
  Widget get body => footer[_index].body;

  List<Widget> get children => footer.map<Widget>((e) => e.body).toList();
}
