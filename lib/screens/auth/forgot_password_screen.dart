import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();

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
            'Forgot\nPassword',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Please type your email below and we\nwill give you a OTP code',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          AppTextField(
            hint: 'Type your Email',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Use Phone Number?',
                style: GoogleFonts.montserrat(color: mainColor),
                textAlign: TextAlign.end,
              ),
            ),
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
