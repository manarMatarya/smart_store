import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String? _method;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment Methods',
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
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        children: [
          Text(
            'Select a payment mothod',
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: secondFontColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.payment,
                  color: yellow,
                  size: 40,
                ),
              ),
              Expanded(
                flex: 5,
                child: RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: mainColor,
                  title: Text(
                    'Cash on delivery',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      color: mainFontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Delivery staff to your door, you give money according to the value of the application and delivery fees for employees.',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: secondFontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: 'cash',
                  groupValue: _method,
                  onChanged: (String? value) {
                    setState(() => _method = value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.home,
                  color: purple,
                  size: 40,
                ),
              ),
              Expanded(
                flex: 5,
                child: RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: mainColor,
                  title: Text(
                    'Bank transfer',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      color: mainFontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'FooHub will call you back to confirm the order. After confirmation, FoodHub will proceed to pick up, pack, issue bill and will notify the actual bill for you to transfer.',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: secondFontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: 'card',
                  groupValue: _method,
                  onChanged: (String? value) {
                    setState(() => _method = value);
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: 100.h,
            color: mainFontColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Temporary price',
                style: GoogleFonts.montserrat(
                  color: secondFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '170\$',
                style: GoogleFonts.montserrat(
                  color: mainFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping fee',
                style: GoogleFonts.montserrat(
                  color: secondFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            height: 100.h,
            color: mainFontColor,
          ),
          Text(
            'Total price',
            style: GoogleFonts.montserrat(
              color: mainFontColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: MainButton(text: 'Continue', onPressed: () {})),
    );
  }
}
