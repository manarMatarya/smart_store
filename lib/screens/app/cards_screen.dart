import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/main.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cards',
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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        itemCount: 2,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.h,
          );
        },
        itemBuilder: (context, index) {
          return TicketWidget(
            color: Colors.white,
            shadow: const [
              BoxShadow(color: Colors.grey),
            ],
            width: double.infinity,
            height: 200.h,
            isCornerRounded: true,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'images/visa.png',
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      '1234 5678 9167 89',
                      style: GoogleFonts.montserrat(
                        color: mainFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Tony Puttichai',
                      style: GoogleFonts.montserrat(
                        color: mainFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Los Angeles',
                      style: GoogleFonts.montserrat(
                        color: mainFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      '22|05|2022',
                      style: GoogleFonts.montserrat(
                        color: mainFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: (){Navigator.pushNamed(context, '/add_card_screen');},
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              
            ),
          ),
          child: Container(
            height: 100.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: DottedBorder(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
              color: greyColor, //color of dotted/dash line
              strokeWidth: 2, //thickness of dash/dots
              dashPattern: const [10, 6],
              child: Center(
                child: Text(
                  'Add New Card',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    color: secondFontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
