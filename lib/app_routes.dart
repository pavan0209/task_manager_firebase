import 'package:auto_route/auto_route.dart';

import 'package:task_manager_firebase/app_auth_guard.dart';
import 'package:task_manager_firebase/screens/index.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({
    required this.authGuard,
    required this.loginAuthGuard,
    super.navigatorKey,
  });

  final AuthGuard authGuard;
  final LoginAuthGuard loginAuthGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: LoginRoute.page, guards: [loginAuthGuard], initial: true),
        AutoRoute(path: '/register', page: RegisterRoute.page, guards: [loginAuthGuard]),
        AutoRoute(path: '/home', page: HomeRoute.page, guards: [authGuard]),
      ];
}
