import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';

import 'dropdown-button-style.dart';
import 'dropdown-item.dart';
import 'dropdown-style.dart';
// if you select something this value will be saved

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget child;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(T, int)? onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>> items;
  final DropdownStyle dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;
  CustomDropdown({
    Key? key,
    this.hideIcon = false,
    this.child = const SizedBox(),
    this.items = const [],
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon = const Icon(Icons.arrow_downward),
    this.leadingIcon = false,
    this.onChange,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  /* Required for setting  to helper text when initial items was changed  */
  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items.length == 0) {
      setState(() {
        _currentIndex = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Container(
        width: style.width,
        height: style.height,
        decoration: BoxDecoration(
            color: StyleHandler.backColor,
            borderRadius: BorderRadius.circular(StyleHandler.borderRadius)),
        child: ElevatedButton(
          style: styleButton(style),
          onPressed: _toggleDropdown,
          child: Row(
            mainAxisAlignment:
                style.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
            textDirection:
                widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_currentIndex == -1) ...[
                widget.child, /* helper Widget text */
              ] else ...[
                widget
                    .items[_currentIndex], /* When clicked will be shown this */
              ],
              if (!widget.hideIcon)
                RotationTransition(
                  turns: _rotateAnimation,
                  /* Will rotate  */
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/icons/arrow.png")), /* Icon */
                ),
            ],
          ),
        ),
      ),
    );
  }

  chooseItem(item) {
    setState(() => _currentIndex = item.key);
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.opaque,
        // full screen container to register taps anywhere and close drop down
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset:
                      widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: this._layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle.elevation ?? 0,
                    borderRadius:
                        widget.dropdownStyle.borderRadius ?? BorderRadius.zero,
                    color: widget.dropdownStyle.color,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height -
                                  topOffset -
                                  15,
                            ),
                        child: ListView(
                          padding:
                              widget.dropdownStyle.padding ?? EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.items.asMap().entries.map((item) {
                            return InkWell(
                              onTap: () {
                                this.chooseItem(item);
                                widget.onChange!(item.value.value!, item.key);
                                _toggleDropdown();
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(StyleHandler.padding),
                                  child: item.value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      this._overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context)!.insert(this._overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }

  void initControllers() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  ButtonStyle styleButton(style) {
    return ElevatedButton.styleFrom(
      padding: style.padding,
      elevation: style.elevation,
      primary: style.primaryColor,
      shape: style.shape,
    );
  }
}
