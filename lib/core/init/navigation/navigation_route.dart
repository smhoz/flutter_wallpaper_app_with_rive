import 'package:flutter/material.dart';
import '../../components/text/not_found.dart';
import '../../constants/navigation/navigation_constant.dart';
import '../../../view/home/view/home_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const HomeView(), NavigationConstants.TEST_VIEW);

      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const HomeView(), NavigationConstants.TEST_VIEW);

      case NavigationConstants.SEARCH_VIEW:
        return normalNavigate(
            args.arguments as SearchView, NavigationConstants.SEARCH_VIEW);

      case NavigationConstants.PHOTO_VIEW:
        return normalNavigate(
            args.arguments as PhotoView, NavigationConstants.PHOTO_VIEW);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigation(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
