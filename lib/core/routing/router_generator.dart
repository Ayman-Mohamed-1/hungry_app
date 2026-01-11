import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routing/app_routes.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/features/auth/data/cubit/login_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/views/signup_view.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/splash_screen.dart';

class RouterGenerator {
  static GoRouter mainRotingInourApp = GoRouter(
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("route not found"))),

    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: AppRoutes.signup,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: const SignupView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.root,
        name: AppRoutes.root,
        builder: (context, state) => const Root(),
      ),
    ],
  );
}
