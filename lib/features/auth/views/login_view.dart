import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routing/app_routes.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/features/auth/data/cubit/login_cubit.dart';
import 'package:hungry_app/features/auth/widget/custom_Auth_btn.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';
import 'package:hungry_app/shared/glassWidget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: glassContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                CupertinoActivityIndicator(color: AppColors.primary);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Column(
                      children: [
                        CupertinoActivityIndicator(color: AppColors.white),
                        Text(state.massege.message.toString()),
                      ],
                    ),
                  ),
                );
                log("error state");
              } else if (state is LoginSuccess) {
                log("success state");
                GoRouter.of(context).pushReplacementNamed(AppRoutes.root);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      Gap(140.h),
                      Banner(
                        color: Colors.green.shade700,
                        message: 'Rich Sonic',
                        location: BannerLocation.topStart,
                        child: SvgPicture.asset(
                          'assets/logo/logo.svg',
                          color: Colors.white70,
                        ),
                      ),
                      Gap(10.h),
                      CustomText(
                        text: 'Welcome Back, Discover The Fast Food',
                        color: Colors.white70,
                        size: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Gap(50.h),
                      // !
                      CustomTextfield(
                        hintText: 'Email Address',
                        isPassword: false,
                        controller: emailController,
                      ),
                      Gap(20.h),
                      CustomTextfield(
                        hintText: 'password',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      Gap(30.h),
                      CustomButton(
                        widget: state is LoginLoding
                            ? CupertinoActivityIndicator(
                                color: AppColors.primary,
                              )
                            : SizedBox.shrink(),
                        gap: 10.w,
                        text: 'Login',
                        color: AppColors.white,
                        textColor: AppColors.black,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomAuthBtn(
                              text: "singup",
                              isIcon: true,
                              textColor: AppColors.white,
                              onTap: () => context.go(AppRoutes.signup),
                            ),
                          ),
                          Gap(15.w),
                          Expanded(
                            child: CustomAuthBtn(
                              text: "Guest",
                              isIcon: true,
                              textColor: AppColors.white,
                              onTap: () => context.go(AppRoutes.root),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 55.w),
                        child: Center(
                          child: CustomText(
                            size: 12.sp,
                            color: Colors.white,
                            text: '@RichSonic2025',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
