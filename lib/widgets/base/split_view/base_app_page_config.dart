import 'package:flutter/material.dart';

class BaseAppPageConfig {
  const BaseAppPageConfig({
    required this.child,
    this.name,
    this.arguments,
    this.restorationId,
    this.fullscreenDialog,
  });

  final Widget child;
  final String? name;
  final Object? arguments;
  final String? restorationId;
  final bool? fullscreenDialog;

  @override
  String toString() {
    return '$runtimeType $child $arguments $restorationId $fullscreenDialog';
  }
}
