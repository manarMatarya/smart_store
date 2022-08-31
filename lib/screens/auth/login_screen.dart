import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
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
            onPressed: () =>
                Navigator.pushNamed(context, '/home_screen'),
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
}


  // Container(
  //           height: 200.h,
  //           decoration: BoxDecoration(
  //             color: mainColor,
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(30.r),
  //               bottomRight: Radius.circular(30.r),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 20.w),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   'Sign In',
  //                   style: GoogleFonts.montserrat(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 20.sp,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 15.h,
  //                 ),
  //                 Text(
  //                   'Welcome back..! please enter your phone number and password to continue login to your account.',
  //                   style: GoogleFonts.montserrat(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 16.sp,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 20.h,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),