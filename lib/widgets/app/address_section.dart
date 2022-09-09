import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.montserrat(
          color: const Color(0xFF75759E), fontSize: 11.sp),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        filled: true,
        fillColor: greyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          borderSide: const BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          borderSide: const BorderSide(color: greyColor),
        ),
      ),
    );
  }
}
