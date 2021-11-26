import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:provider/provider.dart';

class FutureProviderCustom<T extends BaseProvider> extends StatelessWidget {
  final T create;
  final Widget child;
  const FutureProviderCustom({Key? key, required this.child, required this.create})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: this.create,
      child: FutureWidget(child: child, request: this.create.initAsync()),
    );
  }
}
