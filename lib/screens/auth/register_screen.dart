import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth/auth_api_controller.dart';
import 'package:smart_store/get/auth_controller.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/user.dart';
import 'package:smart_store/screens/auth/otp_screen.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/utils/context_extenssion.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;
  bool _obsecure = true;
  String? _gender;
  City? _currentCity;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
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
            height: 20.h,
          ),
          Text(
            'Create new\nAccout',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Please type full information below and\nwe can create your account',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 34.h,
          ),
          AppTextField(
            hint: 'Full Name',
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
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
            height: 20.h,
          ),
          GetX<AuthGetxController>(
            init: AuthGetxController(),
            builder: ((controller) {
              return DropdownButtonFormField<City>(
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints(minHeight: 60.h, maxHeight: 60.h),
                    hintMaxLines: 1,
                    hintText: 'City',
                    hintStyle: GoogleFonts.montserrat(
                      color: const Color(0xFF8992A3),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF6F6F7)),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  items: controller.isLoading.value
                      ? []
                      : controller.cities.map((City city) {
                          return DropdownMenuItem<City>(
                            value: city,
                            child: Text(
                              city.nameEn,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                  onChanged: (City? value) {
                    setState(() {
                      _currentCity = value;
                    });
                  });
            }),
          ),
          SizedBox(
            height: 20.h,
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
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  activeColor: mainColor,
                  title: Text('Male', style: GoogleFonts.montserrat()),
                  value: 'M',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  activeColor: mainColor,
                  title: Text('Female', style: GoogleFonts.montserrat()),
                  value: 'F',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          MainButton(
            text: 'Sign Up',
            onPressed: () {
              _performRegister();
            },
          ),
        ],
      ),
    );
  }

  void _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _currentCity != null &&
        _gender != null &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  _register() async {
    ApiResponse apiResponse = await AuthApiController().register(user: user);

    if (apiResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => OtpScreen(mobile: user.mobile))));
    }
    // ignore: use_build_context_synchronously
    return context.showSnackBar(
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }

  User get user {
    User user = User();
    user.name = _nameController.text;
    user.email = _emailController.text;
    user.mobile = _phoneController.text;
    user.gender = _gender!;
    user.city = _currentCity!;
    user.cityId = _currentCity!.id.toString();
    user.password = _passwordController.text;
    return user;
  }
}
