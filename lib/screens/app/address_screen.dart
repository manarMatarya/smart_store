import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/address_getx_controller.dart';
import 'package:smart_store/get/auth_controller.dart';
import 'package:smart_store/models/address.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/process_response.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/utils/context_extenssion.dart';
import 'package:smart_store/widgets/app/address_section.dart';
import 'package:smart_store/widgets/app/main_button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key, this.address}) : super(key: key);

  final Address? address;
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late TextEditingController _nameController;
  late TextEditingController _infoController;
  late TextEditingController _phoneController;
  City? _currentCity;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address?.name);
    _infoController = TextEditingController(text: widget.address?.info);
    _currentCity = widget.address?.city;
    _phoneController =
        TextEditingController(text: widget.address?.contactNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _infoController.dispose();
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
          title,
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
                      Visibility(
                        visible: isUpdateAddress,
                        replacement: const SizedBox(),
                        child: IconButton(
                          onPressed: () => _showAlertDialog(),
                          icon: const Icon(
                            Icons.delete,
                            color: mainColor,
                          ),
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
                  GetX<AuthGetxController>(
                    init: AuthGetxController(),
                    builder: ((controller) {
                      return DropdownButtonFormField<City>(
                          hint: Text(
                            isUpdateAddress ? _currentCity!.nameEn : '',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xFF75759E),
                                fontSize: 11.sp),
                          ),
                          style: GoogleFonts.montserrat(
                              color: const Color(0xFF75759E), fontSize: 11.sp),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            filled: true,
                            fillColor: greyColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                              borderSide: const BorderSide(color: greyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                              borderSide: const BorderSide(color: greyColor),
                            ),
                          ),
                          items: controller.isLoading.value
                              ? []
                              : controller.cities.map((City city) {
                                  return DropdownMenuItem<City>(
                                    value: city,
                                    child: Text(
                                      city.nameEn,
                                      style:
                                          const TextStyle(color: Colors.black),
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
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: MainButton(text: 'Save', onPressed: () => _performSave()),
      ),
    );
  }

  bool get isUpdateAddress => widget.address != null;

  String get title => isUpdateAddress ? 'Edit Address' : 'Add new Address';

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _infoController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _currentCity != null) {
      return true;
    }
    context.showSnackBar(
      message: "Enter required data",
      error: true,
    );
    return false;
  }

  Future<void> _save() async {
    ProcessResponse processResponse =
        await AddressGetxController.to.addAddress(address: address);

    context.showSnackBar(
        message: processResponse.message, error: !processResponse.success);

    if (processResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  Address get address {
    Address address = isUpdateAddress ? widget.address! : Address();
    address.name = _nameController.text;
    address.info = _infoController.text;
    address.contactNumber = _phoneController.text;
    address.city = _currentCity!;
    address.cityId = _currentCity!.id;
    return address;
  }

  void clear() {
    _nameController.clear();
    _infoController.clear();
    _phoneController.clear();
    _currentCity = null;
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
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
  }
}
