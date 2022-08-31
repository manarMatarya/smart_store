import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';

class ComplaintTextField extends StatelessWidget {
  const ComplaintTextField({
    Key? key,
    required this.controller,
    required this.lines,
  }) : super(key: key);

  final TextEditingController controller;
  final int lines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14.sp),
      controller: controller,
      minLines: lines,
      maxLines: 12,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        filled: true,
        fillColor: secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
