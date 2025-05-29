import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_firebase/screens/mixin/index.dart';

@RoutePage()
class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> with BasicPage {
  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text("Login Page"),
    );
  }
}
