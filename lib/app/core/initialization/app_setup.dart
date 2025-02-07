import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/helper/network_manager.dart';

Future<void> setupAndRunApp(
  Widget Function() builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureApp();

  runApp(builder());
}

Future configureApp() async {
  await GetStorage.init();
  final GetStorage localStorage = GetStorage();
  final Connectivity connectivity = Connectivity();
  // final firebaseRemoteConfig = MellotippetFirebaseRemoteConfig();

  Get
    //GLOBAL
    ..put(localStorage)
    ..put(NetworkManager())
    ..put(connectivity);
  // ..put(ConfigRoute());
  // ..put(NetworkClient());
  // ..put(GHttpClient())
  // ..put(GHttpHelper())
  // ..put(firebaseRemoteConfig)
}
