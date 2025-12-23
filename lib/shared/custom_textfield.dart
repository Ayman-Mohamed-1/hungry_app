import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });

  final String hintText;
  final bool isPassword;
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
      controller: widget.controller,
      cursorHeight: 20,
      cursorColor: AppColors.primary,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter ${widget.hintText}';
        }
        null;
      },
      obscureText: widget.isPassword ? _obscureText : false,

      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _togglePassword,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
              )
            : null,
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hungry_app/core/constants/app_colors.dart';

// class CustomTextfield extends StatelessWidget {
//   CustomTextfield({
//     super.key,
//     required this.hintText,
//     required this.isPassword,

//   });
//   final String hintText = text;
//   final bool obscureText = isPassword;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorHeight: 20,
//       cursorColor: AppColors.primary,
//       validator: (value) {},
//       obscureText: false,
//       decoration: InputDecoration(
//         hintText: "Email",
//         filled: true,
//         fillColor: AppColors.white,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.white),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.white),
//         ),
//       ),
//     );
//   }
// }
