import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/models/bottom_navigation/bottom_navigation_item.dart';
import 'package:location_specialist/helpers/models/icon/icon_menu.dart';
import 'package:location_specialist/pages/main/widgets/category/category_list.dart';
import 'package:location_specialist/pages/main/widgets/home/home.dart';
import 'package:location_specialist/pages/main/widgets/specialist/specialist_list.dart';
import 'package:location_specialist/pages/main/widgets/user/user-edit.dart';
import 'package:location_specialist/providers/common_provider.dart';
import 'package:provider/provider.dart';

class MainPorivder with ChangeNotifier {
  int _index = 0;
  bool _loaded = true;
  List<IconMenu> icons = [];

  bool get loaded => _loaded;

  set loaded(bool loaded) {
    _loaded = loaded;
    notifyListeners();
  }

  PageController controller = new PageController(initialPage: 0);

  void currentPage(int index) {
    controller.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  MainPorivder(BuildContext context) {
    print("MAIN PROVIDER");
    var provider = Provider.of<CommonProvider>(context, listen: false);
    if (!provider.iconStream.isClosed) {
      provider.iconStreaming.listen((IconMenu event) {}, onDone: () {
        setFooter(provider);
      });
    } else {
      setFooter(provider);
    }
  }

  setFooter(var provider) {
    provider.icons.forEach((event) {
      this
          .footer
          .add(BottomNavigationItem(event.image, widgets[event.type.index]));
    });

    loaded = false;
  }

  List<BottomNavigationItem> footer = [];
  static final widgets = [Home(), CategoryList(), SpecialistList(), UserEdit()];

  Widget get body => footer[_index].body;

  List<Widget> get children => footer.map<Widget>((e) => e.body).toList();
}
