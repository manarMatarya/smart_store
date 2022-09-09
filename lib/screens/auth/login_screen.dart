import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth/auth_api_controller.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/models/process_response.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/utils/context_extenssion.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  bool _obsecure = true;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: [
          SizedBox(
            height: 45.h,
          ),
          Image.asset('images/logo.png'),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Please login to use the app',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF8992A3),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hint: 'Phone Number',
            keyboardType: TextInputType.number,
            controller: _phoneController,
          ),
          SizedBox(
            height: 13.h,
          ),
          AppTextField(
            hint: 'Password',
            keyboardType: TextInputType.text,
            controller: _passwordController,
            obscureText: _obsecure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obsecure = !_obsecure;
                });
              },
              icon: Icon(_obsecure ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, '/forgot_password_screen'),
              child: Text(
                'forgot password?',
                style: GoogleFonts.montserrat(color: mainColor),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SizedBox(
            height: 47.h,
          ),
          MainButton(
            text: 'Login',
            onPressed: () => _performLogin(),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account? ',
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF8992A3),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register_screen');
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.montserrat(
                    color: mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  void _login() async {
   ApiResponse processResponse = await AuthApiController().login(
      mobile: _phoneController.text,
      password: _passwordController.text,
    );
    if (processResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: processResponse.message,
      error: !processResponse.success,
    );
  }
}
