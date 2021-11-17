import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_web1/app_route_path.dart';
import 'package:flutter_fam_web1/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MaterialApp.router(
          title: 'Fam Web Training',
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          routeInformationParser: AppRouteInformationParser(),
          routerDelegate: AppRouterDelegate(),
          // home: const MainPage(),
        );
      }
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location.toString());
    // ignore: avoid_print
    print("uri: $uri");

    // handle /
    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }

    // handle /home
    else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home') {
        return AppRoutePath.home();
      }
      if (first == '404') {
        return AppRoutePath.unknown();
      }
    }

    // // handle 'project/:id'
    // else if (uri.pathSegments.length == 2) {
    //   if (uri.pathSegments.first == 'project') {
    //     // if (uri.pathSegments.first == 'project/:id') {
    //     final remaining = uri.pathSegments.elementAt(1);
    //     final id = int.tryParse(remaining);
    //     if (id == null) {
    //       return AppRoutePath.unknown();
    //     }
    //     return AppRoutePath.projectDetails(id);
    //   }
    // }

    else {
      // handle 'unknown page'
      return AppRoutePath.unknown();
    }
    return AppRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isUnknown)
      return const RouteInformation(location: '/404');
    if (configuration.isHome) return const RouteInformation(location: '/home');
    return null;
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  void addListener(VoidCallback listener) {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [
        MaterialPage(
          key: ValueKey('home'),
          name: '/home',
          child: MainPage(),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        // ignore: avoid_print
        print("route of app: $route");
        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    return true;
    // throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    // throw UnimplementedError();
  }
}
