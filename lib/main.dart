import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/routing/router_generator.dart';
import 'package:hungry_app/core/theme/light_theme_data.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/core/utils/storage_helper.dart';
import 'package:hungry_app/features/auth/data/repos/AuthRepo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());

  //  log(SecureStorage.getData("tokin").toString());
  // sl<SecureStorage>().
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterGenerator.mainRotingInourApp,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        // themeMode: AppTheme.lightTheme,
      ),
    );
  }
}
