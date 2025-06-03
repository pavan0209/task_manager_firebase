import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:task_manager_firebase/model/index.dart';

class LoginAuthGuard extends AutoRouteGuard {
  final UserModel? user;

  LoginAuthGuard(this.user);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();
    final isEmailVerified = currentUser?.emailVerified ?? false;

    if (user == null || !isEmailVerified) {
      resolver.next(true); // Allow access to login or register
    } else {
      router.pushNamed('/home'); // Redirect to home if already verified
      resolver.next(false); // Block navigation
    }
  }
}


class AuthGuard extends AutoRouteGuard {
  final UserModel? user;

  AuthGuard(this.user);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload(); // Refresh user info
    final isEmailVerified = currentUser?.emailVerified ?? false;

    if (user == null || !isEmailVerified) {
      router.pushNamed('/');
      resolver.next(false); // Block navigation to home
    } else {
      resolver.next(true); // Allow navigation to home
    }
  }
}


