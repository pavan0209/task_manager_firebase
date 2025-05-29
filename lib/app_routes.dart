import 'package:auto_route/auto_route.dart';

import 'package:task_manager_firebase/app_auth_guard.dart';
import 'package:task_manager_firebase/screens/index.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: LoginRoute.page, guards: [LoginAuthGuard()], initial: true),
        AutoRoute(path: '/home', page: HomeRoute.page, guards: [AuthGuard()] ),
      ];
}
