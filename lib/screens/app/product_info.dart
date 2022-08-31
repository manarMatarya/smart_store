import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';
import 'package:smart_store/widgets/app/home_section.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/app/slider_image.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  int _currentPage = 0;
  double _rating = 3;
  final List _products = [
    {'name': 'Jacket', 'image': 'images/jacket.png'},
    {'name': 'Cake', 'image': 'images/food4.png'},
    {'name': 'Desserts', 'image': 'images/food5.png'},
    {'name': 'Donut', 'image': 'images/food3.png'},
    {'name': 'Apple', 'image': 'images/food6.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  height: 500.h,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int currentPage) {
                      setState(() => _currentPage = currentPage);
                    },
                    children: const [
                      SliderImages(image: 'images/jacket.png'),
                      SliderImages(image: 'images/jacket.png'),
                      SliderImages(image: 'images/jacket.png'),
                    ],
                  ),
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
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Modern Jacket',
                      style: GoogleFonts.zillaSlab(
                        color: mainFontColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
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
                      '30\$',
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
                  Row(
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
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
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.pink,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.orange,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CircleAvatar(
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.nunito(
                      color: secondFontColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Nulla magna esse fugiat duis sint nisi enim aute id. Qui pariatur amet culpa occaecat culpa laboris ad elit qui enim labore velit. Dolore sint ea irure Lorem culpa ad dolore sunt. Cupidatat officia labore consectetur sint et tempor qui sint amet aliquip duis quis Lorem.',
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.nunito(
                      color: secondFontColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MainButton(text: 'Add to Cart', onPressed: () {}),
                  SizedBox(height: 20.h),
                  HomeSection(title: 'Related Products', onPressed: () {}),
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
                            Navigator.pushNamed(
                                context, '/product_info_screen');
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
