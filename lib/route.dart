import 'package:flutter/material.dart';

final _routes = {};

var onGenerateRoute = (RouteSettings settings) {
  String _routeName = settings.name;
  final Function pageControllerBuilder = _routes[_routeName];
  print(_routeName);
  if (pageControllerBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageControllerBuilder(context, arguments: settings.arguments),
      );
      return route;
    }
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageControllerBuilder(context));
  }
};
