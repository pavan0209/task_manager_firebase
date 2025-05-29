import 'package:flutter/material.dart';

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: isAppBarDisabled() ? null : getAppBar(context),
      body: body(context),
      floatingActionButton: getFloatingActionButton(),
      bottomNavigationBar: isFooterDisabled() ? null : bottomNavigationBar(context),
    );
  }

  Widget body(BuildContext context);

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      actions: getActions(context),
    );
  }

  List<Widget>? getActions(BuildContext context) {
    return [];
  }

  Widget? getFloatingActionButton() {
    return null;
  }

  Widget? getAppBarFlexibleSpace() {
    return null;
  }

  Widget bottomNavigationBar(BuildContext context) {
    return const SizedBox.shrink();
  }
}

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BaseState<Page extends BasePage> extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isAppBarDisabled() => false;
  bool isEndDrawerDisabled() => false;
  bool isFooterDisabled() => false;
}
