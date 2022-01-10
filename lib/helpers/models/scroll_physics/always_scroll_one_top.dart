import 'package:flutter/cupertino.dart';

class AlwaysScrollOneTop extends ScrollPhysics {
  const AlwaysScrollOneTop({ScrollPhysics? parent}) : super(parent: parent);
  @override
  AlwaysScrollOneTop applyTo(ScrollPhysics? ancestor) {
    return AlwaysScrollOneTop(parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    print(position.maxScrollExtent);
    return false;
  }
}
