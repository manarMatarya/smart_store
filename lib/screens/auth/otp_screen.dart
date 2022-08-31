import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _firstNumberController;
  late TextEditingController _secondNumberController;
  late TextEditingController _thirdNumberController;
  late TextEditingController _fourthNumberController;

  @override
  void initState() {
    _firstNumberController = TextEditingController();
    _secondNumberController = TextEditingController();
    _thirdNumberController = TextEditingController();
    _fourthNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    _thirdNumberController.dispose();
    _fourthNumberController.dispose();
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
            'Code\nVerification',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Enter the verification code sent via',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 15.sp,
            ),
          ),
          Text(
            '+970598576933',
            style: GoogleFonts.montserrat(
              color: mainColor,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpTextField(firstNumberController: _firstNumberController),
              OtpTextField(firstNumberController: _secondNumberController),
              OtpTextField(firstNumberController: _thirdNumberController),
              OtpTextField(firstNumberController: _fourthNumberController),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          MainButton(
            text: 'Continue',
            onPressed: () =>
                Navigator.pushNamed(context, '/new_password_screen'),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Request a new verification code 1:38',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFC8C8D3),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 135.h,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Resend verification code?',
              style: GoogleFonts.montserrat(
                color: mainColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
