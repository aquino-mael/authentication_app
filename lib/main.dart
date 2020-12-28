import 'package:flutter/material.dart';

import './src/common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    runApp(InitMyApp());
  } catch (e) {
    print(e);
  }
}

class InitMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: 'Authentication App',
      locale: Locale('pt', 'BR'),
      routes: routes,
      initialRoute: '/login',
      navigatorKey: navigatorKey,
      navigatorObservers: [
        navigatorObserver,
      ],
    );
  }
}