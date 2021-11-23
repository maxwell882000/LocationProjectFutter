import 'package:flutter/material.dart';

class DropdownStyle {
  final BorderRadius ?borderRadius;
  final double? elevation;
  final Color ? color;
  final EdgeInsets ? padding;
  final BoxConstraints ? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset ? offset;

  ///button width must be set for this to take effect
  final double ? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}