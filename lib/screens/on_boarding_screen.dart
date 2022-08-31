import 'package:flutter/material.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/widgets/app/main_button.dart';
import 'package:smart_store/widgets/on_boarding_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (int currentPage) {
                  setState(() => _currentPage = currentPage);
                },
                children: const [
                  OnBoardingContent(
                    image: 'image1',
                    title: 'Order fast',
                    content:
                        'Choosing fresh and delicious food right at home, simply select and order.',
                  ),
                  OnBoardingContent(
                    image: 'image2',
                    title: 'Fast shipping',
                    content:
                        'Fast delivery is now simple and fast. Orders will be shipped quickly to you.',
                  ),
                  OnBoardingContent(
                    image: 'image3',
                    title: 'Reflect and evaluate',
                    content:
                        'The enthusiasm to contribute ideas from customers, helping the service more and more developed.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
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
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: MainButton(
                text: 'Get Started!',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
              ),
            ),
            SizedBox(height: 36.h),
          ],
        ),
      ),
    );
  }
}
