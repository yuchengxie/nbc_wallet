import 'package:flutter/material.dart';
import 'package:nbc_wallet/api/managerstate/stateModel.dart';
import 'package:nbc_wallet/pages/tabs.dart';
import 'pages/asset/recordpage.dart';
import 'pages/asset/transferpage.dart';
import 'route.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => StateModel()),
      ],
      child: Consumer<StateModel>(
        builder: (context, stateModel, _) {
          return MaterialApp(
            supportedLocales: const [Locale('en')],
            home: Tabs(),
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute,
            // theme: ThemeData(
            //   primarySwatch: Colors.cyan,
            //   primaryColor:Colors.white
            // ),
          );
        },
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     // return MaterialApp(
//     //   initialRoute: '/',
//     //   onGenerateRoute: onGenerateRoute,
//     // );
//   }
// }
