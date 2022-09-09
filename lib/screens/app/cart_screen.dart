import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/cart_getx_controller.dart';
import 'package:smart_store/screens/app/show_addresses.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartGetxController controller = Get.put(CartGetxController());

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
            onPressed: () {
              CartGetxController.to.clear();
            },
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
      body: Obx(() {
        if (controller.loading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.cartItems.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              return TicketWidget(
                shadow: const [
                  BoxShadow(color: Colors.grey),
                ],
                width: double.infinity,
                height: 220.h,
                isCornerRounded: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'images/logo.png',
                            width: 50.w,
                            height: 20.h,
                          ),
                          Text(
                            controller.cartItems[index].productName,
                            style: GoogleFonts.montserrat(
                              color: mainFontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              CartGetxController.to.changeQuantity(index, 0);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: mainFontColor,
                            ),
                          )
                        ]),
                    Row(
                      children: [
                        Image.network(
                          controller.cartItems[index].image,
                          width: 100.w,
                          height: 100.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'red',
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
                                'M',
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
                                controller.cartItems[index].price.toString(),
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
                                    onPressed: () {
                                      CartGetxController.to.changeQuantity(
                                        index,
                                        controller.cartItems[index].count + 1,
                                      );
                                    },
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
                                      controller.cartItems[index].count
                                          .toString(),
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
                                    onPressed: () {
                                      CartGetxController.to.changeQuantity(
                                        index,
                                        controller.cartItems[index].count - 1,
                                      );
                                    },
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
                          controller.cartItems[index].total.toString(),
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
          );
        } else {
          return Center(
            child: Text(
              'CART IS EMPTY',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          );
        }
      }),
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
                  controller.total.toString(),
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
            MainButton(
              text: 'Submit',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowAddresses(
                      isOrder: true,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
