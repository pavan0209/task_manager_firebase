import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:task_manager_firebase/app_auth_guard.dart';
import 'package:task_manager_firebase/app_routes.dart';
import 'package:task_manager_firebase/model/index.dart';
import 'package:task_manager_firebase/service/index.dart';
import 'package:task_manager_firebase/styles/index.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _observer = AutoRouterObserver();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: Builder(
        builder: (context) {
          final user = Provider.of<UserModel?>(context);

          final _appRouter = AppRouter(
            authGuard: AuthGuard(user),
            loginAuthGuard: LoginAuthGuard(user),
          );

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              _appRouter,
              navigatorObservers: () => [_observer],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppThemes.lightTheme(),
          );
        },
      ),
    );
  }
}
