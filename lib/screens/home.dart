import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_firebase/screens/mixin/index.dart';

@RoutePage()
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with BasicPage {
  @override
  Widget body(BuildContext context) {
    return const Center(child: Text('Home Page'),);
  }
}