import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);
  final Color color;
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: mainFontColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: GoogleFonts.montserrat(
          color: secondFontColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: greyColor,
        ),
      ),
    );
  }
}
