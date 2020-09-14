import 'package:bel_trains/core/common/index.dart';
import 'package:bel_trains/core/provider_models/index.dart';
import 'package:bel_trains/ui/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = Get.key;

  Future<dynamic> navigateTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.push(route);
  }

  Future<dynamic> navigateWithReplacementTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.pushReplacement(route);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  void goBackToShell({int index = 0}) {
    navigatorKey.currentState.popUntil((Route<dynamic> route) {
      return route.settings?.name == ShellPage.route;
    });

    Provider.of<ShellProviderModel>(navigatorKey.currentContext, listen: false)
        .onTappedItem(index);
  }

  Route<dynamic> _generateRoute(Pages page, Object arguments) {
    Widget resultPage;
    RouteSettings settings;

    switch (page) {
      case Pages.shell:
        resultPage = ShellPage();
        settings = const RouteSettings(name: ShellPage.route);
        break;
      default:
        resultPage = ShellPage();
        break;
    }

    return _getRoute(resultPage, settings: settings);
  }

  Route<dynamic> _getRoute(Widget widget, {RouteSettings settings}) {
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}
