import 'package:flutter/material.dart';
import 'package:nbc_wallet/api/provider/stateModel.dart';
import 'package:nbc_wallet/pages/tabs.dart';
import 'route.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StateModel _stateModel=Provider.of<StateModel>(context);
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
            theme: ThemeData(
              brightness: stateModel.walletTheme.brightness,
              appBarTheme: AppBarTheme(
                color: stateModel.walletTheme.appBarbackColor,
              ),
            ),
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
