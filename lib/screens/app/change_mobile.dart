import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/text_field.dart';

class ChangeMobile extends StatefulWidget {
  const ChangeMobile({Key? key}) : super(key: key);

  @override
  State<ChangeMobile> createState() => _ChangeMobileState();
}

class _ChangeMobileState extends State<ChangeMobile> {
  late TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: mainFontColor),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: [
          SizedBox(
            height: 45.h,
          ),
          Text(
            'Edit\nMobile',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Please type your phone number below and we\nwill give you a OTP code',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          AppTextField(
            hint: 'your phone number',
            keyboardType: TextInputType.emailAddress,
            controller: _phoneController,
          ),
          SizedBox(
            height: 40.h,
          ),
          MainButton(
            text: 'Next',
            onPressed: () => Navigator.pushNamed(context, '/otp_screen'),
          ),
        ],
      ),
    );
  }
}
