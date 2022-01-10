import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/widgets/loading/providers/loading_provider.dart';
import 'package:provider/provider.dart';

class Loading<T extends LoadingProvider> extends StatelessWidget {
  final Widget child;
  const Loading({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            Visibility(
                visible: provider.loading,
                child: Center(child: CircularProgressIndicator())),
            Visibility(
              maintainState: true,
              visible: !provider.loading, child: child!)
          ],
        );
      },
      child: child,
    );
  }
}
