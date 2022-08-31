import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/address_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  late TextEditingController _phoneController;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Jessica Biber');
    _emailController = TextEditingController(text: 'JessicaBiber@gmail.com');
    _genderController = TextEditingController(text: 'Female');
    _phoneController = TextEditingController(text: '0598576933');
    _cityController = TextEditingController(text: 'Los Angilos');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _cityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Account',
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: mainFontColor,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: mainFontColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
      
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressSection(
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressSection(
                      controller: _emailController,
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'City',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressSection(
                      controller: _cityController,
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Gender',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressSection(
                      controller: _genderController,
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Phone Number',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressSection(
                      controller: _phoneController,
                    ),
      
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
