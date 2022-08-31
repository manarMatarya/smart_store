import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      style: GoogleFonts.montserrat(),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        constraints: BoxConstraints(minHeight: 60.h, maxHeight: 60.h),
        hintMaxLines: 1,
        suffixIcon: suffixIcon,
        suffixIconColor: mainColor,
      
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(
          color: const Color(0xFF8992A3),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
          borderRadius: BorderRadius.circular(30.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    );
  }
}
