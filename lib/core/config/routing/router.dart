import 'dart:io';
import 'package:alhalawa_flutter_boilerplate/core/config/routing/router_config.dart';
import 'package:alhalawa_flutter_boilerplate/error_screen.dart';
import 'package:alhalawa_flutter_boilerplate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GRouter {
  static GRouter? _instance;

  factory GRouter() => _instance ??= GRouter();

  static GoRouter get router => _router;

  RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: _config.krpRoot,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _builderPage(
            child: const MyHomePage(title: 'Home Page',),
            state: state,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(exception: state.error),
  );

  static Page<dynamic> _builderPage<T>({required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
