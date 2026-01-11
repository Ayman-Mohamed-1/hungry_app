import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/styling/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    this.isSearch,
  });

  final String hintText;
  final bool isPassword;
  final bool? isSearch;
  final TextEditingController controller;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 20.h,
      style: TextStyle(fontSize: 14.sp, color: Colors.white),
      controller: widget.controller,
      cursorColor: AppColors.primary,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        // border: ,
        contentPadding: EdgeInsets.all(8),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _togglePassword,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
              )
            : null,
        prefixIcon: widget.isSearch == true ? Icon(Icons.search) : null,
        hintText: widget.hintText,
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter ${widget.hintText}';
        }
        return null;
      },
    );
  }
}
