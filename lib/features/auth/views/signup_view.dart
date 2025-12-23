import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset("assets/logo/logo.svg"),
                  Gap(10),
                  CustomText(
                    text: "Welcome Back, Discover The Fast Food",
                    color: AppColors.white,
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(60),
                  CustomTextfield(
                    hintText: 'Name',
                    isPassword: false,
                    controller: nameController,
                  ),
                  Gap(20),
                  CustomTextfield(
                    hintText: 'Email Address',
                    isPassword: false,
                    controller: emailController,
                  ),
                  Gap(20),
                  CustomTextfield(
                    hintText: 'password',
                    isPassword: true,
                    controller: passController,
                  ),
                  Gap(20),
                  CustomTextfield(
                    hintText: 'Confirm password',
                    isPassword: true,
                    controller: passConfirmController,
                  ),
                  Gap(40),
                  CustomButton(
                    text: 'Sign Up',
                    bgColor: AppColors.white,
                    textColor: AppColors.primary,
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        log("login successful");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
