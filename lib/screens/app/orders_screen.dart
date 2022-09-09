import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/orders_getx_controller.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:ticket_widget/ticket_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrdersGetxController ordersGetxController = OrdersGetxController.to;

  @override
  void initState() {
    super.initState();
    ordersGetxController.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Orders',
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
        body: GetX<OrdersGetxController>(builder: (controller) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: controller.orders.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/order_details_screen');
                  },
                  child: TicketWidget(
                    shadow: const [
                      BoxShadow(color: Colors.grey),
                    ],
                    width: double.infinity,
                    height: 300.h,
                    isCornerRounded: true,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          height: 20.h,
                          width: 100.w,
                        ),
                        Divider(
                          height: 40.h,
                          color: secondFontColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order ${controller.orders[index].id}',
                              style: GoogleFonts.montserrat(
                                color: mainFontColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              controller.orders[index].date,
                              style: GoogleFonts.montserrat(
                                color: secondFontColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Payment method: ',
                              style: GoogleFonts.montserrat(
                                color: secondFontColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              controller.orders[index].paymentType,
                              style: GoogleFonts.montserrat(
                                color: secondFontColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Status: ',
                              style: GoogleFonts.montserrat(
                                color: secondFontColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              controller.orders[index].status,
                              style: GoogleFonts.montserrat(
                                backgroundColor: Colors.green.shade100,
                                
                                color: Colors.green,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Oranges (1kg), Mango (1kg), Beef (1kg)',
                          style: GoogleFonts.montserrat(
                            color: mainFontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Divider(
                          height: 40.h,
                          color: secondFontColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: GoogleFonts.montserrat(
                                color: mainFontColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              controller.orders[index].total,
                              style: GoogleFonts.montserrat(
                                color: mainColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }));
  }
}
