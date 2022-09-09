import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smart_store/get/cart_getx_controller.dart';
import 'package:smart_store/get/products_getx_controller.dart';
import 'package:smart_store/models/cart.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';
import 'package:smart_store/widgets/app/home_section.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/app/product_images_slider.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({Key? key, required this.currentProduct})
      : super(key: key);
  final Product currentProduct;

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  int _currentPage = 0;
  double _rating = 3;
  CartGetxController cartGetxController =
      Get.put<CartGetxController>(CartGetxController());

  ProductsGetxController productsGetxController = ProductsGetxController.to;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      productsGetxController.getProductDetails(
        id: widget.currentProduct.id.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 500.h,
                child: GetX<ProductsGetxController>(builder: (controller) {
                  return controller.isLoading.value || controller.images.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      : PageView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (int currentPage) {
                            setState(() => _currentPage = currentPage);
                          },
                          children: [
                            ProductSliderImages(
                                image: controller.images[0].imageUrl),
                            ProductSliderImages(
                                image: controller.images[1].imageUrl),
                            ProductSliderImages(
                                image: controller.images[2].imageUrl),
                          ],
                        );
                }),
              ),
              Positioned(
                bottom: 20.h,
                left: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabPageSelectorIndicator(
                      backgroundColor:
                          _currentPage == 0 ? mainColor : greyColor,
                      borderColor: _currentPage == 0 ? mainColor : greyColor,
                      size: 8.h,
                    ),
                    TabPageSelectorIndicator(
                      backgroundColor:
                          _currentPage == 1 ? mainColor : greyColor,
                      borderColor: _currentPage == 1 ? mainColor : greyColor,
                      size: 8.h,
                    ),
                    TabPageSelectorIndicator(
                      backgroundColor:
                          _currentPage == 2 ? mainColor : greyColor,
                      borderColor: _currentPage == 2 ? mainColor : greyColor,
                      size: 8.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.w,
                bottom: 20.h,
                child: const Icon(
                  Icons.favorite_border,
                  color: mainColor,
                ),
              ),
            ]),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
                    title: Text(
                      widget.currentProduct.nameEn,
                      style: GoogleFonts.zillaSlab(
                        color: mainFontColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        RatingBar.builder(
                          initialRating:
                              widget.currentProduct.productRate.toDouble(),
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                        Text(
                          _rating.toString(),
                          style: GoogleFonts.montserrat(
                            color: mainFontColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      widget.currentProduct.price,
                      style: GoogleFonts.nunito(
                        color: secondFontColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Size:',
                          style: GoogleFonts.nunito(
                            color: secondFontColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
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
                                'S',
                                style: GoogleFonts.nunito(
                                  color: const Color(0xFF57636F),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(30.w, 30.h),
                                  primary: mainColor,
                                  elevation: 0),
                              onPressed: () {},
                              child: Text(
                                'M',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(30.w, 30.h),
                                  primary: const Color(0xFFF6F6F7),
                                  elevation: 0),
                              onPressed: () {},
                              child: Text(
                                'L',
                                style: GoogleFonts.nunito(
                                  color: const Color(0xFF57636F),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(30.w, 30.h),
                                  primary: const Color(0xFFF6F6F7),
                                  elevation: 0),
                              onPressed: () {},
                              child: Text(
                                'XL',
                                style: GoogleFonts.nunito(
                                  color: const Color(0xFF57636F),
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Colors:',
                          style: GoogleFonts.nunito(
                            color: secondFontColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.pink,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.orange,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.yellow,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Count:',
                          style: GoogleFonts.nunito(
                            color: secondFontColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      'Description',
                      style: GoogleFonts.nunito(
                        color: secondFontColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      widget.currentProduct.infoEn,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.nunito(
                        color: secondFontColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: MainButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        CartGetxController.to.create(
                          getCart(widget.currentProduct,),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  HomeSection(title: 'Related Products', onPressed: () {}),
                  GetX<ProductsGetxController>(
                    builder: (controller) {
                      return Container(
                        padding: EdgeInsets.only(left: 30.w),
                        constraints: BoxConstraints(maxHeight: 173.h),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.products.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10.w,
                            crossAxisSpacing: 10.h,
                            childAspectRatio: 173.h / 122.w,
                          ),
                          itemBuilder: (context, index) {
                            return CustomProduct(
                              image: controller.products[index].imageUrl,
                              name: controller.products[index].nameEn,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Cart getCart(Product product) {
    Cart cart = Cart();
    cart.productId = widget.currentProduct.id;
    cart.productName = widget.currentProduct.nameEn;
    cart.price = double.parse(widget.currentProduct.price);
    cart.total = double.parse(widget.currentProduct.price);
    cart.userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;
    cart.count = 1;
    cart.productName = widget.currentProduct.nameEn;
    cart.image = widget.currentProduct.imageUrl;

    return cart;
  }
}
