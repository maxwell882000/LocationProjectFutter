import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';

class SearchTextField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String Function(String?)? validatator;
  final void Function(bool hasFocus)? onFocusChange;
  final bool autofocus;
  final TextEditingController? controller;
  final Function? textListener;
  final FocusNode? focus;
  final String? hintText;
  SearchTextField(
      {Key? key,
      this.hintText = "Введите Адресс",
      this.onSaved,
      this.textListener,
      this.controller,
      this.autofocus = false,
      this.validatator,
      this.focus,
      this.onFocusChange})
      : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus = widget.focus ?? new FocusNode();
    if (widget.autofocus) {
      _focus.requestFocus();
    }
    _focus.addListener(() {
      if (widget.onFocusChange != null) {
        widget.onFocusChange!(_focus.hasFocus);
      }
      if (widget.controller != null && widget.textListener != null) {
        widget.controller!.addListener(() => widget.textListener!());
      }
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BaseTextField(
        controller: widget.controller,
        focusNode: _focus,
        hintText:widget.hintText,
        /*      autofocus: widget.autofocus, */
        onSaved: widget.onSaved,
        validatator: widget.validatator,
      ),
    );
  }
}
