import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/main.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ShowAddresses extends StatelessWidget {
  const ShowAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Address',
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
            )),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/address_screen');
            },
            child: TicketWidget(
              shadow: const [
                BoxShadow(color: Colors.grey),
              ],
              width: double.infinity,
              height: 135.h,
              isCornerRounded: true,
              padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Los Angilos',
                              style: GoogleFonts.montserrat(
                                color: mainFontColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Hay Elsalam, street 8',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.sp,
                            color: secondFontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '0598576933',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.sp,
                            color: secondFontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Rafah',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.sp,
                            color: secondFontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: mainColor,
                    size: 60,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.h,
          );
        },
      ),
      bottomNavigationBar: Card(
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
                'Add New Address',
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
    );
  }
}
