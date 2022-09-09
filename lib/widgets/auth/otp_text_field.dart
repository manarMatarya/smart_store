import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    required TextEditingController firstNumberController,
  })  : _firstNumberController = firstNumberController,
        super(key: key);

  final TextEditingController _firstNumberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: GoogleFonts.montserrat(),
      maxLength: 1,
      controller: _firstNumberController,
      decoration: InputDecoration(
        counterText: '',
        constraints: BoxConstraints(
            minHeight: 50.h, maxHeight: 50.h, minWidth: 50.w, maxWidth: 50.w),
        hintMaxLines: 1,
        hintStyle: GoogleFonts.montserrat(
          color: const Color(0xFF8992A3),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F7),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r)),
        ),
      ),
    );
  }
}
