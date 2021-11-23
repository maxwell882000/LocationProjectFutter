import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/text/text-lang.dart';

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
    "Изменить данные",
    "Правила пользования",
    "Добавить локацию",
    "Выйти"
  ];
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        onPressed: () {
          openButton();
        },
        icon: Icon(
          open ? Icons.close : Icons.menu,
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
                onPressed: () {},
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

  void openButton() async {
    if (open) {
      await _animationController.reverse();
      this._overlayEntry.remove();
    } else {
      this._overlayEntry = this._createMenu();
      Overlay.of(context)!.insert(this._overlayEntry);
    }
    setState(() {
      open = !open;
    });
  }
}
