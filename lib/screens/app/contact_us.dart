import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/address_section.dart';
import 'package:smart_store/widgets/app/complaint_text_field.dart';
import 'package:smart_store/widgets/app/main_button.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
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
          'Contact Us',
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
                     SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Image.asset(
                        'images/support.png',
                        width: 100.w,
                        height: 100.h,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Complaint Title',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ComplaintTextField(
                      controller: _titleController,
                      lines: 1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Complaint Content',
                      style: GoogleFonts.montserrat(
                        color: secondFontColor,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ComplaintTextField(
                      controller: _contentController,
                      lines: 10,
                    ),
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: MainButton(text: 'Send', onPressed: () {}),
      ),
    );
  }
}
