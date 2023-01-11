import 'package:flutter/material.dart';

class AppRouter {
  static void route(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }
}
