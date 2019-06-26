import 'package:flutter/material.dart';
import 'route.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('wallet demo'),
      //   ),
      //   body: Text('111'),
      // ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
