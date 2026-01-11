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

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: glassContainer(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is SignupError) {
              CupertinoActivityIndicator(color: AppColors.primary);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Column(
                    children: [Text(state.massege.message.toString())],
                  ),
                ),
              );
            } else if (state is SignupSuccess) {
              log("success state");
              GoRouter.of(context).pushReplacementNamed(AppRoutes.root);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Form(
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
                        hintText: 'Name',
                        isPassword: false,
                        controller: nameController,
                      ),
                      Gap(20.h),
                      CustomTextfield(
                        hintText: 'Email Address',
                        isPassword: false,
                        controller: emailController,
                      ),
                      Gap(20.h),
                      CustomTextfield(
                        hintText: 'password',
                        isPassword: true,
                        controller: passController,
                      ),
                      Gap(30.h),

                      CustomButton(
                        widget: state is SignupLoding
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
                            context.read<LoginCubit>().signup(
                              email: emailController.text,
                              password: passController.text,
                              name: nameController.text,
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
                              text: "login",
                              isIcon: true,
                              textColor: AppColors.white,
                              onTap: () => context.go(AppRoutes.login),
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
