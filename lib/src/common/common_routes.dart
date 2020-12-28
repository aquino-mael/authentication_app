import 'package:flutter/material.dart';

import '../screens/screens.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final navigatorObserver = NavigatorObserver();

Map<String, Widget Function(BuildContext)> routes = {
  '/splash': (context) => SplashScreen(), 
  '/login': (context) => Login(),
  '/home': (context) => Home(),
};