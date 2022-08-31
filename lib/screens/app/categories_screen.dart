import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/custom_product.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final List _categories = [
      {
        'name': 'Meat, Fish',
        'selected': 'images/selected_fish.png',
        'unselected': 'images/unselected_fish.png',
      },
      {
        'name': 'Vegetable',
        'selected': 'images/selected_vegetable.png',
        'unselected': 'images/unselected_vegetable.png',
      },
      {
        'name': 'Fruit',
        'selected': 'images/selected_fruit.png',
        'unselected': 'images/unselected_fruit.png',
      },
      {
        'name': 'Eggs, milk',
        'selected': 'images/selected_milk.png',
        'unselected': 'images/unselected_milk.png',
      },
      {
        'name': 'Eat Clean',
        'selected': 'images/selected_clean.png',
        'unselected': 'images/unselected_clean.png',
      },
    ];
    final List _products = [
      {
        'name': 'Salmon',
        'image': 'images/meet1.png',
      },
      {
        'name': 'Pork',
        'image': 'images/meet2.png',
      },
      {
        'name': 'Beef',
        'image': 'images/meet3.png',
      },
      {
        'name': 'Lobster',
        'image': 'images/meet4.png',
      },
      {
        'name': 'wing',
        'image': 'images/meet5.png',
      },
      {
        'name': 'Pork ribs',
        'image': 'images/meet6.png',
      },
    ];
    int selected_item = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Foods',
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
      body: ListView(
        children: [
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
                return InkWell(
                  onTap: () {
                    setState(() {
                      selected_item = index;
                    });
                  },
                  child: selected_item == index
                      ? Column(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r),
                                ),
                              ),
                              child:
                                  Image.asset(_categories[index]['selected']),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              _categories[index]['name'],
                              style: GoogleFonts.montserrat(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: greyColor),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r),
                                ),
                              ),
                              child:
                                  Image.asset(_categories[index]['unselected']),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              _categories[index]['name'],
                              style: GoogleFonts.montserrat(
                                color: greyColor,
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
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.w,
              crossAxisSpacing: 20.h,
           childAspectRatio: 160.h / 180.w,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomProduct(
                image: _products[index]['image'],
                name: _products[index]['name'],
              );
            },
          ),
        ],
      ),
    );
  }
}
