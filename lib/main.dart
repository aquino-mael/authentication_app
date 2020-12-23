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
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: background,
        visualDensity: VisualDensity.comfortable,
        textTheme: TextTheme(
          // Theme para Text();
          bodyText2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Color(0xFF363636),
          ),
          // Theme para labels
          subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
          // Theme para Text() no butão;
          button:  TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4.0,
          shadowColor: Color(0xFFCCCCCC),
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        buttonTheme: ButtonThemeData(
          disabledColor: background,
          buttonColor: primary,
          textTheme: ButtonTextTheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
          ),
        ),
      ),
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