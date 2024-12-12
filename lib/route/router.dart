import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../components/home.dart';
import '../components/home/dashboard.dart';
import '../components/login/login.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/welcome":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/login":
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case "/home":
        return MaterialPageRoute(builder: (context) => const DashboardPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}

class NavigatorArguments {
  final String title;
  final dynamic params;
  NavigatorArguments({required this.title, required this.params});
}
