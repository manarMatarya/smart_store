import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/address_section.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late TextEditingController _nameController;
  late TextEditingController _infoController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Krystal Biber');
    _infoController = TextEditingController(text: 'Los Angeles');
    _cityController = TextEditingController(text: 'gaza');
    _phoneController = TextEditingController(text: '598576933');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _infoController.dispose();
    _cityController.dispose();
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
        centerTitle: true,
        title: Text(
          'Edit Address',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Address',
                        style: GoogleFonts.montserrat(
                          color: mainFontColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 50.w, vertical: 20.h),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(100.w, 50.h),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style: GoogleFonts.montserrat(
                                          color: mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(100.w, 50.h),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'No',
                                        style: GoogleFonts.montserrat(
                                          color: mainFontColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                  content: Text(
                                    'Do you want to delete this address?',
                                    style: GoogleFonts.montserrat(
                                      color: mainFontColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
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
                    'Information',
                    style: GoogleFonts.montserrat(
                      color: secondFontColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddressSection(
                    controller: _infoController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Telephone Number',
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
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: SwitchListTile(
                title: Text(
                  'Set as default address',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    color: secondFontColor,
                  ),
                ),
                activeColor: mainColor,
                onChanged: (bool value) {
                  setState(() {
                    _isDefault = !_isDefault;
                  });
                },
                value: _isDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
