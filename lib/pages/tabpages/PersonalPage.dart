import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/managerstate/stateModel.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateModel _stateModel=Provider.of<StateModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.yellow),
            accountEmail: Text('xxxxxxx@163.com'),
            accountName: Text('hzf'),
          )
        ],
      )),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    'https://www.itying.com/images/flutter/3.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text('切换主题'),
            subtitle: Text('切换主题，夜间模式，白天模式'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              this.changeTheme(_stateModel);
            },
          ),
          Divider(height: 10,),
        ],
      ),
    );
  }

  void changeTheme(StateModel model){
    WalletTheme _theme=WalletTheme();
    _theme.brightness=model.walletTheme.brightness==Brightness.light?Brightness.dark:Brightness.light;
    _theme.appBarbackColor=model.walletTheme.appBarbackColor==Colors.cyan?Colors.black12:Colors.cyan;
    model.updateTheme(_theme);
  }
}
