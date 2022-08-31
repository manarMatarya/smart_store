import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final List _categories = [
    {'name': 'Women\nFashion', 'image': 'images/women.png', 'color': yellow},
    {'name': 'Men\nFashion', 'image': 'images/men.png', 'color': purple},
    {'name': 'Child\nFashion', 'image': 'images/child.png', 'color': shadePink},
    {'name': 'Food\n& Drink', 'image': 'images/food.png', 'color': blue},
    {'name': 'Kitchen\nTools', 'image': 'images/kitchen.png', 'color': orange},
    {'name': 'Furniture', 'image': 'images/furniture.png', 'color': yellow},
    {'name': 'Hobby', 'image': 'images/hobby.png', 'color': purple},
    {
      'name': 'Electronic',
      'image': 'images/electronic.png',
      'color': shadePink
    },
  ];
  final List _products = [
    {'name': 'Jacket', 'image': 'images/jacket.png'},
    {'name': 'Cake', 'image': 'images/food4.png'},
    {'name': 'Desserts', 'image': 'images/food5.png'},
    {'name': 'Donut', 'image': 'images/food3.png'},
    {'name': 'Apple', 'image': 'images/food6.png'},
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
                SliderImages(image: 'images/slider1.jpeg'),
                SliderImages(image: 'images/slider2.jpg'),
                SliderImages(image: 'images/slider3.jpg'),
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
          Expanded(
            child: ListView(
              children: [
                HomeSection(
                    title: 'Category',
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories_screen');
                    }),
                Container(
                  padding: EdgeInsets.only(left: 30.w),
                  height: 110.h,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _categories.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16.w,
                      crossAxisSpacing: 16.h,
                      childAspectRatio: 110.h / 70.w,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: _categories[index]['color'],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Image.asset(_categories[index]['image']),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            _categories[index]['name'],
                            style: GoogleFonts.montserrat(
                              color: mainFontColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                    itemCount: _products.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.h,
                      childAspectRatio: 173.h / 122.w,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/product_info_screen');
                        },
                        child: CustomProduct(
                          image: _products[index]['image'],
                          name: _products[index]['name'],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                HomeSection(title: 'Products you may like', onPressed: () {}),
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TicketWidget(
                      height: 160.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      isCornerRounded: true,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Redeem points',
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
                                initialRating: 3,
                                itemSize: 12,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 3,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0.w),
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
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/food1.png',
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
                                    '400 \$',
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
          )
        ],
      ),
    );
  }
}
