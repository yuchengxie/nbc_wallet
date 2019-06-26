

import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  FindPage({Key key}) : super(key: key);

  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('发现'),),
    );
  }
}