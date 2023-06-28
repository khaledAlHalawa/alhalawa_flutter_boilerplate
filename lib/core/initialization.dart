import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:alhalawa_flutter_boilerplate/core/models/localization_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'di/di_container.dart';

Future<void> initialization(
  FutureOr<Widget> Function() builder, {
  LocalizationConfig? localizationConfig,
}) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();

      FlutterError.onError = (FlutterErrorDetails details) async {
        final String exception = details.exceptionAsString();
        final StackTrace? stackTrace = details.stack;

        log(details.exceptionAsString(), name: "FlutterError", stackTrace: stackTrace);

        if (kDebugMode) {
          FlutterError.dumpErrorToConsole(details);
        } else {
          Zone.current.handleUncaughtError(exception, stackTrace!);
        }
      };

      ErrorWidget.builder = (errorDetails) {
        return Container();
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        return true;
      };

      final Widget app;
      if (localizationConfig != null) {
        app = await _easyLocalization(builder, localizationConfig);
      } else {
        app = await builder();
      }

      runApp(app);
    },
    (error, stackTrace) async {
      if (kDebugMode) {
        print('Caught Dart Error!');
        print('$error');
        print('$stackTrace');
      } else {
        exit(1);
      }
    },
  );
}

Future<EasyLocalization> _easyLocalization(
  FutureOr<Widget> Function() builder,
  LocalizationConfig localizationConfig,
) async {
  await EasyLocalization.ensureInitialized();
  return EasyLocalization(
    supportedLocales: localizationConfig.supportedLocales,
    useOnlyLangCode: localizationConfig.useOnlyLangCode,
    saveLocale: localizationConfig.saveLocale,
    startLocale: localizationConfig.startLocale,
    useFallbackTranslations: localizationConfig.useFallbackTranslations,
    path: localizationConfig.path,
    child: await builder(),
  );
}
