import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AssetPage extends StatefulWidget {
  AssetPage({Key key}) : super(key: key);

  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   // title: Text('资产'),
        //   // backgroundColor: Colors.cyan,
        // ),
        body: Column(
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.cyan,
          child: Row(
            children: <Widget>[],
          ),
        ),
        Container(
            color: Colors.purple[300],
            child: ListTile(
              leading: Icon(Icons.explicit),
              title: Text(
                'NBC',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '= 0.0000 RMB',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/assetRecordPage');
              },
            )),
        // Container(
        //   child: ListView(
        //     children: <Widget>[
        //       ListTile(
        //         title: Text('ETH'),
        //         subtitle: Text('0.0000'),
        //       )
        //     ],
        //   ),
        // )
      ],
    ));
  }
}

class AssetHead extends StatelessWidget {
  const AssetHead({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
