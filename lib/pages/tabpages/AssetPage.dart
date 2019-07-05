import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nbc_wallet/api/managerstate/stateModel.dart';
import 'package:provider/provider.dart';

// 数据源
List<String> titleItems = <String>[
  'keyboard',
  'print',
  'router',
  'pages',
  'zoom_out_map',
  'zoom_out',
  'youtube_searched_for',
  'wifi_tethering',
  'wifi_lock',
  'widgets',
  'weekend',
  'web',
  '图accessible',
  'ac_unit',
];

List<Icon> iconItems = <Icon>[
  new Icon(Icons.keyboard),
  new Icon(Icons.print),
  new Icon(Icons.router),
  new Icon(Icons.pages),
  new Icon(Icons.zoom_out_map),
  new Icon(Icons.zoom_out),
  new Icon(Icons.youtube_searched_for),
  new Icon(Icons.wifi_tethering),
  new Icon(Icons.wifi_lock),
  new Icon(Icons.widgets),
  new Icon(Icons.weekend),
  new Icon(Icons.web),
  new Icon(Icons.accessible),
  new Icon(Icons.ac_unit),
];

List<String> subTitleItems = <String>[
  'subTitle: keyboard',
  'subTitle: print',
  'subTitle: router',
  'subTitle: pages',
  'subTitle: zoom_out_map',
  'subTitle: zoom_out',
  'subTitle: youtube_searched_for',
  'subTitle: wifi_tethering',
  'subTitle: wifi_lock',
  'subTitle: widgets',
  'subTitle: weekend',
  'subTitle: web',
  'subTitle: accessible',
  'subTitle: ac_unit',
];

Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
    String subTitleItem) {
  return new ListTile(
    leading: iconItem,
    title: new Text(
      titleItem,
      style: TextStyle(fontSize: 18),
    ),
    subtitle: new Text(
      subTitleItem,
    ),
    trailing: new Icon(Icons.keyboard_arrow_right),
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              'ListViewAlert',
              style: new TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
            content: new Text('您选择的item内容为:$titleItem'),
          );
        },
      );
    },
  );
}

class AssetPage extends StatefulWidget {
  AssetPage({Key key}) : super(key: key);

  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  //测试
  @override
  Widget build(BuildContext context) {
    StateModel _stateModel=Provider.of<StateModel>(context);
    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }

    // 分割线
    var divideTiles =
        ListTile.divideTiles(context: context, tiles: _list).toList();

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: 300,
          child: Row(
              children: <Widget>[
                Expanded(
                  child:Image.network('https://www.itying.com/images/flutter/6.png',
                  fit: BoxFit.cover,)
                )
              ],
              ),
        ),
        ListTileCoin(),
        // ListTileCoin(),
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

class ListTileCoin extends StatelessWidget {
  const ListTileCoin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Image.asset('images/a.jpeg'),
          ),
          title: Text(
            'NBC',
          ),
          subtitle: Text(
            '= 0.0000 RMB',
          ),
          onTap: () {
            Navigator.pushNamed(context, '/assetRecordPage');
          },
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Divider(
          height: 10,
        ),
      ],
    );
  }
}
// class ListTileCoin extends StatefulWidget {
//   ListTileCoin({Key key}) : super(key: key);

//   _ListTileCoinState createState() => _ListTileCoinState();
// }

// class _ListTileCoinState extends State<ListTileCoin> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         ListTile(
//           leading: CircleAvatar(
//             child: Image.asset('images/a.jpeg'),
//           ),
//           title: Text(
//             'NBC',
//           ),
//           subtitle: Text(
//             '= 0.0000 RMB',
//           ),
//           onTap: () {
//             Navigator.pushNamed(context, '/assetRecordPage');
//           },
//           trailing: Icon(Icons.keyboard_arrow_right),
//         ),
//         Divider(
//           height: 10,
//         ),
//       ],
//     );
//   }
// }
