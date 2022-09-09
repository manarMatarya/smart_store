import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/address_getx_controller.dart';
import 'package:smart_store/get/orders_getx_controller.dart';
import 'package:smart_store/screens/app/address_screen.dart';
import 'package:smart_store/screens/app/payment_methods.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ShowAddresses extends StatefulWidget {
  const ShowAddresses({Key? key, this.isOrder}) : super(key: key);
  final bool? isOrder;

  @override
  State<ShowAddresses> createState() => _ShowAddressesState();
}

class _ShowAddressesState extends State<ShowAddresses> {
  AddressGetxController controller = Get.put(AddressGetxController());
  OrdersGetxController orderController = Get.put(OrdersGetxController());

  @override
  void initState() {
    super.initState();
    controller.getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          isOrder ? 'Choose address' : 'My Address',
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
      body: GetX<AddressGetxController>(builder: (controller) {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : controller.addresses.isEmpty
                ? Center(
                    child: Text(
                      'NO ADDRESSES',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                    itemCount: controller.addresses.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          isOrder
                              ? orderController.addressId.value =
                                  controller.addresses[index].id.toString()
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => AddressScreen(
                                          address: controller.addresses[index],
                                        )),
                                  ),
                                );
                        },
                        child: TicketWidget(
                          shadow: const [
                            BoxShadow(color: Colors.grey),
                          ],
                          width: double.infinity,
                          height: 135.h,
                          isCornerRounded: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.h, vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.addresses[index].name,
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
                                      controller.addresses[index].info,
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
                                      controller.addresses[index].contactNumber,
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
                                      controller.addresses[index].city.nameEn,
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
                  );
      }),
      bottomNavigationBar: Visibility(
        visible: isOrder,
        maintainState: true,
        maintainSize: true,
        maintainAnimation: true,
        replacement: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/address_screen');
            },
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
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
          child: MainButton(
            text: 'next',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PaymentMethods()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool get isOrder => widget.isOrder != null;
}
