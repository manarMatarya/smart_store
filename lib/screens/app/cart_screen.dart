import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List _carts = [
    {
      'name': 'Fruits',
      'image': 'images/food1.png',
      'color': 'Dark Grey',
      'size': 'L',
      'price': '18\$',
      'quantity': '120\$'
    },
    {
      'name': 'Cake',
      'image': 'images/food4.png',
      'color': 'Silver',
      'size': 'S',
      'price': '50\$',
      'quantity': '120\$'
    },
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
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
              Icons.clear,
              color: Colors.red,
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: mainFontColor,
            )),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        itemCount: _carts.length,
        itemBuilder: (context, index) {
          return TicketWidget(
            shadow: const [
              BoxShadow(color: Colors.grey),
            ],
            width: double.infinity,
            height: 220.h,
            isCornerRounded: true,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: 50.w,
                          height: 20.h,
                        ),
                        Image.asset(
                          _carts[index]['image'],
                          width: 100.w,
                          height: 100.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _carts[index]['name'],
                                style: GoogleFonts.montserrat(
                                  color: mainFontColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(
                                Icons.delete,
                                color: mainFontColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Color: ' + _carts[index]['color'],
                            style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              color: secondFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Size: ' + _carts[index]['size'],
                            style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              color: secondFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            _carts[index]['price'],
                            style: GoogleFonts.montserrat(
                              fontSize: 18.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(30.w, 30.h),
                                    primary: const Color(0xFFF6F6F7),
                                    elevation: 0),
                                onPressed: () {},
                                child: Text(
                                  '+',
                                  style: GoogleFonts.nunito(
                                    color: secondFontColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50.w,
                                height: 30.h,
                                color: const Color(0xFFF6F6F7),
                                child: Text(
                                  '1',
                                  style: GoogleFonts.nunito(
                                    color: secondFontColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(30.w, 30.h),
                                    primary: const Color(0xFFF6F6F7),
                                    elevation: 0),
                                onPressed: () {},
                                child: Text(
                                  '-',
                                  style: GoogleFonts.nunito(
                                    color: secondFontColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: secondFontColor,
                  // height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sub Total:      ',
                      style: GoogleFonts.montserrat(
                        color: mainFontColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _carts[index]['quantity'],
                      style: GoogleFonts.montserrat(
                        color: Colors.red,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.h,
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: GoogleFonts.montserrat(
                    color: mainFontColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '300\$',
                  style: GoogleFonts.montserrat(
                    color: mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            MainButton(text: 'Submit', onPressed: () {
              Navigator.pushNamed(context, '/payment_methods_screen');
            })
          ],
        ),
      ),
    );
  }
}
