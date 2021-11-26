import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String path;
  final double size;
  final BoxFit fit;
  final Widget indicator;
  const ImageNetwork(
      {Key? key,
      required this.indicator,
      required this.path,
      required this.size,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        this.path,
        height: this.size,
        width: this.size,
        fit: fit,
        errorBuilder: (context, object, trace) {
          return Container(
            width: this.size,
            height: this.size,
            color: Colors.grey,
          );
        },
        frameBuilder: (context, child, frame, loaded) {
          if (loaded) {
            return child;
          }
          return AnimatedOpacity(
            child: child,
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        },
        loadingBuilder: (context, child, loadingProcess) {
          if (loadingProcess == null) return child;
          return this.indicator;
        },
      ),
    );
  }
}
