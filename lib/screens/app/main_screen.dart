import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/get/categorey_getx_controller.dart';
import 'package:smart_store/get/products_getx_controller.dart';
import 'package:smart_store/screens/app/categories_screen.dart';
import 'package:smart_store/screens/app/product_info.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';
import 'package:smart_store/widgets/app/home_section.dart';
import 'package:smart_store/widgets/app/slider_image.dart';
import 'package:ticket_widget/ticket_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CategoryGetxController categoryGetxController =
      Get.put(CategoryGetxController());
  ProductsGetxController productsGetxController =
      Get.put(ProductsGetxController());
  final List _colors = [
    yellow,
    purple,
    shadePink,
    blue,
    orange,
    yellow,
    purple,
    shadePink,
    blue,
    orange,
  ];

  int _currentPage = 0;
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            height: 200.h,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (int currentPage) {
                setState(() => _currentPage = currentPage);
              },
              children: const [
                SliderImages(
                  image: 'images/slider1.jpeg',
                ),
                SliderImages(
                  image: 'images/slider2.jpg',
                ),
                SliderImages(
                  image: 'images/slider3.jpg',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabPageSelectorIndicator(
                backgroundColor: _currentPage == 0 ? mainColor : greyColor,
                borderColor: _currentPage == 0 ? mainColor : greyColor,
                size: 8.h,
              ),
              TabPageSelectorIndicator(
                backgroundColor: _currentPage == 1 ? mainColor : greyColor,
                borderColor: _currentPage == 1 ? mainColor : greyColor,
                size: 8.h,
              ),
              TabPageSelectorIndicator(
                backgroundColor: _currentPage == 2 ? mainColor : greyColor,
                borderColor: _currentPage == 2 ? mainColor : greyColor,
                size: 8.h,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Obx(
            () => Expanded(
              child: (categoryGetxController.isLoading.value ||
                      productsGetxController.isLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : ListView(
                      children: [
                        HomeSection(
                            title: 'Category',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/categories_screen');
                            }),
                        categoryGetxController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(left: 30.w),
                                height: 110.h,
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      categoryGetxController.categories.length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 16.w,
                                    crossAxisSpacing: 16.h,
                                    childAspectRatio: 110.h / 70.w,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        categoryGetxController.getSubCategories(
                                            id: categoryGetxController
                                                .categories[index].id
                                                .toString());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesScreen(
                                              category: categoryGetxController
                                                  .categories[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 60.w,
                                            height: 60.h,
                                            decoration: BoxDecoration(
                                              color: _colors[index],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.r),
                                                bottomLeft:
                                                    Radius.circular(16.r),
                                                bottomRight:
                                                    Radius.circular(16.r),
                                              ),
                                            ),
                                            child: Image.network(
                                                categoryGetxController
                                                    .categories[index]
                                                    .imageUrl),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            categoryGetxController
                                                .categories[index].nameEn,
                                            style: GoogleFonts.montserrat(
                                              color: mainFontColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                        SizedBox(height: 20.h),
                        HomeSection(title: 'Latest Products', onPressed: () {}),
                        Container(
                          padding: EdgeInsets.only(left: 30.w),
                          constraints: BoxConstraints(maxHeight: 173.h),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: productsGetxController.products.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10.w,
                              crossAxisSpacing: 10.h,
                              childAspectRatio: 173.h / 122.w,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ProductInfoScreen(
                                            currentProduct:
                                                productsGetxController
                                                    .products[index],
                                          )),
                                    ),
                                  );
                                },
                                child: CustomProduct(
                                  image: productsGetxController
                                      .products[index].imageUrl,
                                  name: productsGetxController
                                      .products[index].nameEn,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        HomeSection(
                            title: 'Products you may like', onPressed: () {}),
                        ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productsGetxController.likeProducts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ProductInfoScreen(
                                            currentProduct:
                                                productsGetxController
                                                    .likeProducts[index],
                                          )),
                                    ),
                                  ),
                              child: TicketWidget(
                                height: 160.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                isCornerRounded: true,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'images/logo.png',
                                          height: 20.h,
                                          width: 100.w,
                                        ),
                                        const Icon(
                                          Icons.favorite_border,
                                          color: mainColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      productsGetxController
                                          .likeProducts[index].nameEn,
                                      style: GoogleFonts.montserrat(
                                        color: mainFontColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Rating',
                                          style: GoogleFonts.montserrat(
                                            color: secondFontColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        RatingBar.builder(
                                          initialRating: productsGetxController
                                              .likeProducts[index].productRate
                                              .toDouble(),
                                          itemSize: 12,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 3,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1.0.w),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            setState(() {
                                              _rating = rating;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          productsGetxController
                                              .likeProducts[index].imageUrl,
                                          width: 120.w,
                                          height: 60.h,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Discount code \$2',
                                              style: GoogleFonts.montserrat(
                                                color: secondFontColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              productsGetxController
                                                  .likeProducts[index].price,
                                              style: GoogleFonts.montserrat(
                                                color: mainColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
