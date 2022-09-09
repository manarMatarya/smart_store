import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth/auth_api_controller.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/utils/context_extenssion.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.mobile}) : super(key: key);
  final String mobile;

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
            widget.mobile,
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
            onPressed: () {
              _performActivate();
            },
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

  void _performActivate() async {
    if (_checkData()) {
      await _activate();
    }
  }

  bool _checkData() {
    if (_firstNumberController.text.isNotEmpty &&
        _secondNumberController.text.isNotEmpty &&
        _thirdNumberController.text.isNotEmpty &&
        _fourthNumberController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  _activate() async {
    ApiResponse apiResponse =
        await AuthApiController().activate(mobile: widget.mobile, code: code);

    if (apiResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login_screen');
    }
    // ignore: use_build_context_synchronously
    return context.showSnackBar(
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }

  int get code {
    return int.parse(_firstNumberController.text +
        _secondNumberController.text +
        _thirdNumberController.text +
        _fourthNumberController.text);
  }
}
