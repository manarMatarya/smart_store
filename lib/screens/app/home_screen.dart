import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_store/models/bn_screen.dart';
import 'package:smart_store/screens/app/favorite_screen.dart';
import 'package:smart_store/screens/app/main_screen.dart';
import 'package:smart_store/screens/app/orders_screen.dart';
import 'package:smart_store/screens/app/setting_screen.dart';
import 'package:smart_store/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: MainScreen()),
    const BnScreen(title: 'Favorite', widget: FavoriteScreen()),
    const BnScreen(title: 'Orders', widget: OrdersScreen()),
    const BnScreen(title: 'Settings', widget: SettingScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedPageIndex].widget,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
      Navigator.pushNamed(context, '/cart_screen');
        },
        child: const Icon(Icons.shopping_cart_rounded),
      ),
      bottomNavigationBar: SizedBox(
        height: 60.h,
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.home_rounded,
                    color: _selectedPageIndex == 0 ? mainColor : greyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedPageIndex = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: _selectedPageIndex == 1 ? mainColor : greyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedPageIndex = 1;
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag,
                    color: _selectedPageIndex == 2 ? mainColor : greyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedPageIndex = 2;
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.settings_rounded,
                    color: _selectedPageIndex == 3 ? mainColor : greyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedPageIndex = 3;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (int selectedPageIndex) {
      //     setState(() => _selectedPageIndex = selectedPageIndex);
      //   },
      //   currentIndex: _selectedPageIndex,
      //   backgroundColor: Colors.white,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: mainColor,
      //   selectedIconTheme: const IconThemeData(
      //     color: mainColor,
      //     size: 30,
      //   ),
      //   unselectedItemColor: greyColor,
      //   unselectedIconTheme: const IconThemeData(
      //     color: greyColor,
      //     size: 30,
      //   ),
      //   iconSize: 30,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_rounded),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications_rounded),
      //       label: 'notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.circle),
      //       label: 'more',
      //     ),
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.circle),
      //       label: 'more',
      //     ),
      //   ],
      // ),
    );
  }
}
