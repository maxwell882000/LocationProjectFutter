import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class ACTION {
  static const CHANGE_PASSWORD = 0;
  static const RULE_OF_USAGE = 1;
  static const ADD_LOCATION = 2;
  static const PAY_FOR = 3;
  static const INSTRUCTION = 4;
  static const EXIT = 5;
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
    'Инструкции',
    "Выйти"
  ];
  final String DECLINE_SUB = "Отменить подписку";

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
      case ACTION.INSTRUCTION:
        closeMenu();
        Get.toNamed(Path.INSTRUCTIONS);
        break;
      case ACTION.EXIT:
        closeMenu();
        logout();
        break;
    }
  }

  empty() {}

  Widget showTextOfMenu(context, index) {
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    if (index == ACTION.PAY_FOR) {
      if (user?.isSpecialist == false) {
        return SizedBox();
      } else if (user?.isAutoPayment == true) {
        return text(askAboutDeclineSub, DECLINE_SUB);
      }
    }

    return text(() => this.actionsOnClick(index), this.items[index]);
  }

  askAboutDeclineSub() {
    closeMenu();
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Отменить подписку"),
              content: Text("Вы уверены что хотите отменить подписку ?"),
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
                      provider.deactivateSub();
                    },
                    child: Text("Да")),
              ],
            ));
    // show dialog and decline subscription
  }

  TextButton text(Function function, String text) {
    return TextButton(
        onPressed: () => function(),
        child: Align(alignment: Alignment.centerLeft, child: TextLang(text)));
  }

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
            itemBuilder: showTextOfMenu,
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

  Future removeOverlay() async {
    await _animationController.reverse();
    try {
      this._overlayEntry.remove();
    } catch (exception) {
      print(exception);
    }
  }

  Future closeMenu() async {
    await removeOverlay();
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

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  void toggleMenu() async {
    if (open) {
      await closeMenu();
    } else {
      this.insertMenu();
    }
  }
}
