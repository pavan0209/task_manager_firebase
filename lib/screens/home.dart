import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_firebase/screens/mixin/index.dart';
import 'package:task_manager_firebase/service/index.dart';

@RoutePage()
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with BasicPage {
  final AuthService _auth = AuthService();

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }

  @override
  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () async {
            await _auth.signOut();
          },
          icon: const Icon(Icons.logout_outlined),
        )
      ],
    );
  }
}
