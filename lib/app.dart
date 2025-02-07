import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/utils/theme/theme.dart';
import 'app/routes/app_pages.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) => App();
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Ebony Market",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: GAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
