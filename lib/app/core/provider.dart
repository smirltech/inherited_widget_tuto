import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  const Provider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<T>>()!.data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
