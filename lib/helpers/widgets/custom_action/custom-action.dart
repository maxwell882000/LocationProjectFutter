import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class ACTION {
  static const CHANGE_PASSWORD = 0;
  static const RULE_OF_USAGE = 1;
  static const ADD_LOCATION = 2;
  static const PAY_FOR = 3;
  static const EXIT = 4;
}

class CustomAction extends StatefulWidget {
  const CustomAction({Key? key}) : super(key: key);

  @override
  _CustomActionState createState() => _CustomActionState();
}

class _CustomActionState extends State<CustomAction>
    with SingleTickerProviderStateMixin {
  bool open = false;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late OverlayEntry _overlayEntry;
  final List<String> items = [
    "Изменить пароль",
    "Политика конфиденциальности",
    "Добавить локацию",
    "Оплата услуг",
    "Выйти"
  ];

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  actionsOnClick(int index) {
    switch (index) {
      case ACTION.CHANGE_PASSWORD:
        closeMenu();
        Get.toNamed(Path.CHANGE_PASSWORD);
        break;
      case ACTION.RULE_OF_USAGE:
        closeMenu();
        Get.toNamed(Path.CONFIDENTIAL);
        break;
      case ACTION.PAY_FOR:
        closeMenu();
        Get.toNamed(Path.PAYMENT);
        break;
      case ACTION.ADD_LOCATION:
        closeMenu();
        Get.toNamed(Path.LOCATION_FORM);
        break;
      case ACTION.EXIT:
        closeMenu();
        logout();
        break;
    }
  }

  empty() {}

  logout() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Нет")),
                TextButton(
                    onPressed: () {
                      Get.back();
                      var provider =
                          Provider.of<AuthProvider>(context, listen: false);
                      provider.logout();
                    },
                    child: Text("Да")),
              ],
              title: Text('Выйти'),
              content: Text('Вы уверены что хотите выйти?'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        onPressed: () {
          toggleMenu();
        },
        icon: Icon(
          open ? Icons.close : Icons.menu,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }

  OverlayEntry _createMenu() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(top: size.height + offset.dy),
          padding: EdgeInsets.all(20),
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.6,
          height: Get.height * 0.8,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) => TextButton(
                onPressed: () => this.actionsOnClick(index),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextLang(this.items[index]))),
            itemCount: this.items.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 2,
            ),
          ),
        ),
      ),
    );
  }

  void initControllers() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _expandAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  Future closeMenu() async {
    await _animationController.reverse();
    this._overlayEntry.remove();
    setState(() {
      open = false;
    });
  }

  void insertMenu() async {
    this._overlayEntry = this._createMenu();
    Overlay.of(context)!.insert(this._overlayEntry);
    setState(() {
      open = true;
    });
  }

  void toggleMenu() async {
    if (open) {
      await closeMenu();
    } else {
      this.insertMenu();
    }
  }
}
