import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'About',
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
     
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: mainFontColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/logo.png'),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'E-Commerce Application',
                    style: GoogleFonts.montserrat(
                      color: secondFontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Text(
                    'About Application',
                    style: GoogleFonts.montserrat(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'An online store application that allows users to browse the goods according to multiple categories, add them to favorites, add them to the shopping cart, confirm the order and determine the optimal payment method, in addition to many advantages for the user once an account is created for him on the store.',
                    style: GoogleFonts.montserrat(
                      height: 2,
                      color: mainFontColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Text(
                    'About Developer',
                    style: GoogleFonts.montserrat(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Manar K. Matarya',
                    style: GoogleFonts.montserrat(
                      height: 2,
                      color: mainFontColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('images/facebook.png', width: 20.w, height: 20.h,),
                    title: Text(
                      'https://www.facebook.com/profile.php?id=100027256025393',
                      style: GoogleFonts.montserrat(
                        height: 2,
                        color: mainFontColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('images/instagram.png', width: 20.w, height: 20.h,),
                    title: Text(
                      'https://www.instagram.com/manar.k.matarya/',
                      style: GoogleFonts.montserrat(
                        height: 2,
                        color: mainFontColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('images/linkedin.png', width: 20.w, height: 20.h,),
                    title: Text(
                      'https://www.linkedin.com/in/manarkmatarya/',
                      style: GoogleFonts.montserrat(
                        height: 2,
                        color: mainFontColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
