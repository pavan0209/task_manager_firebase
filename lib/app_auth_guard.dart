import 'package:auto_route/auto_route.dart';

class LoginAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (false) {
      resolver.next(true);
    } else {
      router.pushNamed('/home');
      resolver.next(false);
    }
  }
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (false) {
      router.pushNamed('/');
      resolver.next(false);
    } else {
      resolver.next(true);
    }
  }
}
