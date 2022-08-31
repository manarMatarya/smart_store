import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/auth/text_field.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  late TextEditingController _numberController;
  late TextEditingController _dateController;
  late TextEditingController _cvvController;
  late TextEditingController _holderController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    _dateController = TextEditingController();
    _cvvController = TextEditingController();
    _holderController = TextEditingController();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _dateController.dispose();
    _cvvController.dispose();
    _holderController.dispose();

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
          'Add Cards',
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
          AppTextField(
            hint: 'Number',
            keyboardType: TextInputType.text,
            controller: _numberController,

          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  hint: 'Expired Date',
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  controller: _dateController,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppTextField(
                  hint: 'CVV',
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  controller: _cvvController,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          AppTextField(
            hint: 'Card Holder',
            keyboardType: TextInputType.text,
            controller: _holderController,
          ),
          SizedBox(height: 30.h),
          MainButton(text: 'Save', onPressed: () {}),
        ],
      ),
    );
  }
}
